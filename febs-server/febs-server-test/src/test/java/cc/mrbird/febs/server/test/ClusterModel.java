package cc.mrbird.febs.server.test;

import java.util.Map;

/**
 * @author liulongxiang
 * @description: 聚类模型
 * @date 2021/11/13
 */
public class ClusterModel {
    public double originalCenters[][];
    public int centerCounts[];
    public int attempts; //最大迭代次数
    public double criteriaBreakCondition; // 迭代结束时的最小阈值
    public int[] labels;
    public int k;
    public int perm[];//连续存放的样本
    public int start[];//每个中心开始的位置
    public Map<String,Integer> identifier;
    public Kmeans_data data;
    public Map<Integer, String> iden0;

    public void centers(){
        System.out.println("聚类中心:");
        for (int i = 0; i < originalCenters.length; i++) {
            for (int j = 0; j < originalCenters[0].length; j++) {
                System.out.print(originalCenters[i][j] + " ");
            }
            System.out.print("\t"+"第" + (i+1)+"类：" + "\t" + "样本个数：" + centerCounts[i]);
            System.out.println();
        }
    }

    public int predict(String iden){
        int label = labels[identifier.get(iden)];
        return label;
    }

    public void outputAllResult(){
        System.out.println("\n最后聚类结果--------------------------->");

        int originalCount = 0;
        for (int i = 0; i < k; i++) {
            int index = labels[perm[start[i]]];
            int counts = centerCounts[index];
            originalCount += counts;
            System.out.println("第"+(index+1)+"类成员：");
            for (int j = start[i]; j < originalCount; j++) {
                for (double num : data.data[perm[j]]) {
                    System.out.print(num + " ");
                }
                System.out.print(":"+iden0.get(perm[j]));
                System.out.println();
            }
        }
    }
}
