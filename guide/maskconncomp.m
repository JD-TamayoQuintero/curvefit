function [mask]= maskconncomp(BW1)

temp=BW1;

CC = bwconncomp(BW1);

numPixels = cellfun(@numel,CC.PixelIdxList); [biggest,idx] = max(numPixels); BW1(CC.PixelIdxList{idx}) = 0;

temp2 = imcomplement(BW1); mask=temp2.*temp;

end





