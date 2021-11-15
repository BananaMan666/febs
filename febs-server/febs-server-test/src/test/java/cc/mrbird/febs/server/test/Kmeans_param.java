package cc.mrbird.febs.server.test;

/**
 * @author liulongxiang
 * @description: 控制k_means迭代的参数
 * @date 2021/11/13
 */
public class Kmeans_param {
    public static final int K = 240;//系统默认的最大聚类中心个数
    public static final int MAX_ATTEMPTS = 4000;//最大迭代次数
    public static final double MIN_CRITERIA = 0.1;
    public static final double MIN_EuclideanDistance = 0.8;
    public double criteria = MIN_CRITERIA; //最小阈值
    public int attempts = MAX_ATTEMPTS;
    public boolean isDisplay = true;
    public double min_euclideanDistance = MIN_EuclideanDistance;
}
