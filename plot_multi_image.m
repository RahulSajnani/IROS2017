function plot_multi_image(K,tracklets)

    multi_wireframe=importdata('multicpp/ceres_output_mutliViewShapeAdjuster.txt');
    for i = 1:(size(multi_wireframe,1)/14)
        Image = fullfile('~/Robotics Research Centre/KITTI dataset/data_tracking_image_2/training/image_02/', sprintf('%04d/%06d.png', table2array(tracklets(i, {'sequence'})), table2array(tracklets(i, {'frame'}))));
        a = multi_wireframe((14*i - 13):(14*i),1:3)';
        a = K*a;
        a = a./a(3,:);
        figure;
        visualizeWireframe2D(Image, a(1:2,:));
        pause(1.0);
    end
end
