img = imread("PuzzleBadLighting.jpg" );
imshow(img)

%Phir us specific pixel ki RGB values nikalne ke liye:

pixel = img(604,411,:)


imtool("PuzzleBadLighting.jpg") 