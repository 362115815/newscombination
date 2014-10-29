package bean;

import java.util.Dictionary;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;

/**
 * Created by xiaomin on 2014/10/29.
 */
public class Similarity {

    public static double getSimilarity(String doc1, String doc2) throws Exception {

        if (doc1 != null && doc1.trim().length() > 0 && doc2 != null && doc2.trim().length() > 0) {
            HashMap<Integer, int[]> hashmap = new HashMap<Integer, int[]>();
            for (int i = 0; i < doc1.length(); i++) {
                char d1 = doc1.toCharArray()[i];
                if (isHanzi(d1)) {
                    int charIndex = getGB2312Id(d1);

                    if (charIndex != -1) {
                        int[] fq = null;
                        try {
                            {
                                fq = hashmap.get(charIndex);
                            }
                        } catch (Exception e) {
                            System.out.println(e);
                        } finally {
                            if (fq != null && fq.length == 2) {
                                fq[0]++;
                            } else {
                                fq = new int[2];
                                fq[0] = 1;
                                fq[1] = 0;
                                hashmap.put(charIndex, fq);
                            }
                        }
                    }
                }
            }

            for (int i = 0; i < doc2.length(); i++) {
                char d2 = doc2.toCharArray()[i];
                if (isHanzi(d2)) {
                    int charIndex = getGB2312Id(d2);
                    if (charIndex != -1) {
                        int[] fq = null;
                        try {
                            fq = hashmap.get(charIndex);
                        } catch (Exception e) {

                        } finally {
                            if (fq != null && fq.length == 2) {
                                fq[1]++;
                            } else {
                                fq = new int[2];
                                fq[0] = 0;
                                fq[1] = 1;
                                hashmap.put(charIndex, fq);
                            }
                        }
                    }
                }
            }

            double sqdoc1 = 0;
            double sqdoc2 = 0;
            double  numerator = 0;
            Iterator iter = hashmap.entrySet().iterator();
            while (iter.hasNext()) {
                HashMap.Entry entry = (HashMap.Entry) iter.next();
                int[] fq = (int[]) (int[]) entry.getValue();
                numerator+= fq[0] * fq[1];
                sqdoc1 += fq[0] * fq[0];
                sqdoc2 += fq[1] * fq[1];
            }
            return  numerator/ Math.sqrt(sqdoc1 * sqdoc2);

        } else throw new Exception();
    }



    //判断输入字符是不是汉字
    public  static boolean isHanzi(char ch)
    {
        //判断是否汉字
        return (ch >= 0x4E00 && ch<= 0x9FA5);
    }
    /**
     * 根据输入的Unicode字符，获取它的GB2312编码或者ascii编码，
     *
     * @param ch
     *            输入的GB2312中文字符或者ASCII字符(128个)
     * @return ch在GB2312中的位置，-1表示该字符不认识
     */
    public static short getGB2312Id(char ch)
    {
        try {

            byte []buffer=String.valueOf(ch).getBytes("GB2312");
            if (buffer.length!=2)
            {
                return -1;
            }
            int b0=(int)(buffer[0]&0x0FF)-161;//编码从A1开始，因此减去0xA1=161
            int b1=(int)(buffer[1]&0x0FF)-161;//第一个字符和最后一个字符没有汉字，因此每个区只收16*6-2=94个汉字
            return (short)(b0*94+b1);
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        return -1;
    }

}

