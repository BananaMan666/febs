package cc.mrbird.febs.server.test;

import org.junit.Test;

/**
 * @author liulongxiang
 * @description:
 * train方法有两种，一个不需要传递K值，算法内部自动处理为最优值，此为最细粒度聚类，
 * 一个需要传递K值，k值大小任意，当k值>算法内部最优值时，自动调整 为最优值
 *  利用model预测时，只需传递feature标识
 * @date 2021/11/13
 */
public class KmeansTest {
    @Test
    public void test() throws Exception {
        Kmeans kmeans = new Kmeans();
        String path = "F:\\kmeans.txt";
        ClusterModel model = kmeans.train(path);
        model.centers();
        System.out.println("中国属于第" + (model.predict("中国") + 1) + "类");
        model.outputAllResult();
        System.out.println("-------------------------------------------------------------------------------------");
        model = kmeans.train(path, 100000);
        model.centers();
        System.out.println("中国属于第" + (model.predict("中国") + 1) + "类");
        model.outputAllResult();
    }
}
