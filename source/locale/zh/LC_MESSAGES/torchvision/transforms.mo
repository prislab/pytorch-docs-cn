��    F      L              |  4   }    �  �   �  +   m  %   �     �  7   �  ,        :     V  �   g  �   �  .   w  ?   �  �   �  9   q	  (   �	     �	  8   �	  �   )
  w   �
  �   %     $     ,  �   ?  �   *  I   �  s   "  k   �  b     s   e     �  #   �        )   <    f     ~  A   �  6   �  a       r  �     @   3  %  t  i   �  D     J   I  �   �  -   $     R  #   m  1   �  0   �  �   �  [   �            +   7  G   c  �  �  !   9     [  8   z  8   �  (   �          ,     3     :  �  G  4   �      �     +   �  %   �        7   '   ,   _      �      �   �   �   �   F!  .   �!  ?   �!  �   8"  9   �"  (   �"     &#  8   B#  �   {#  w   �#  �   w$     v%     ~%  �   �%  �   |&  I   *'  s   t'  k   �'  b   T(  s   �(     +)  #   I)      m)  )   �)    �)     �*  A   �*  6   ++  a   b+    �+  �   �,  @   �-  %  �-  i   �.  D   V/  J   �/  �   �/  -   v0     �0  #   �0  1   �0  0   1  �   F1  [   �1     T2     l2  +   �2  G   �2  �  �2  !   �4     �4  8   �4  8   5  (   >5     g5     ~5     �5     �5   (1 or 3) number of channels desired for output image A crop of random size (default: of 0.08 to 1.0) of the original size and a random aspect ratio (default: of 3/4 to 4/3) of the original aspect ratio is made. This crop is finally resized to given size. This is popularly used to train the Inception networks. An optional resampling filter. See http://pillow.readthedocs.io/en/3.4.x/handbook/concepts.html#filters If omitted, or if the image has mode "1" or "P", it is set to PIL.Image.NEAREST. Apply a user-defined lambda as a transform. Composes several transforms together. Conversion Transforms Convert a ``PIL Image`` or ``numpy.ndarray`` to tensor. Convert a tensor or an ndarray to PIL Image. Convert image to grayscale. Converted image. Converts a PIL Image or numpy.ndarray (H x W x C) in the range [0, 255] to a torch.FloatTensor of shape (C x H x W) in the range [0.0, 1.0]. Converts a torch.*Tensor of shape C x H x W or a numpy ndarray of shape H x W x C to a PIL Image while preserving the value range. Crop the given PIL Image at a random location. Crop the given PIL Image into four corners and the central crop Crop the given PIL Image into four corners and the central crop plus the flipped version of these (horizontal flipping is used by default) Crop the given PIL Image to random size and aspect ratio. Crops the given PIL Image at the center. Default: PIL.Image.BILINEAR Desired interpolation. Default is ``PIL.Image.BILINEAR`` Desired output size of the crop. If size is an ``int`` instead of sequence like (h, w), a square crop of size (size, size) is made. Desired output size of the crop. If size is an int instead of sequence like (h, w), a square crop (size, size) is made. Desired output size. If size is a sequence like (h, w), output size will be matched to this. If size is an int, smaller edge of the image will be matched to this number. i.e, if height > width, then image will be rescaled to (size * height / width, size) Example Generic Transforms Grayscale version of the input image with probability p and unchanged with probability (1-p). - If input image is 1 channel: grayscale version is 1 channel - If input image is 3 channel: grayscale version is 3 channel with r == g == b Grayscale version of the input. - If num_output_channels == 1 : returned image is single channel - If num_output_channels == 3 : returned image is 3 channel with r == g == b Horizontally flip the given PIL Image randomly with a probability of 0.5. How much to jitter brightness. brightness_factor is chosen uniformly from [max(0, 1 - brightness), 1 + brightness]. How much to jitter contrast. contrast_factor is chosen uniformly from [max(0, 1 - contrast), 1 + contrast]. How much to jitter hue. hue_factor is chosen uniformly from [-hue, hue]. Should be >=0 and <= 0.5. How much to jitter saturation. saturation_factor is chosen uniformly from [max(0, 1 - saturation), 1 + saturation]. Image converted to PIL Image. Image to be converted to PIL Image. Image to be converted to tensor. Lambda/function to be used for transform. Normalize an tensor image with mean and standard deviation. Given mean: ``(M1,...,Mn)`` and std: ``(S1,..,Sn)`` for ``n`` channels, this transform will normalize each channel of the input ``torch.*Tensor`` i.e. ``input[channel] = (input[channel] - mean[channel]) / std[channel]`` Normalized Tensor image. Note: This transform is deprecated in favor of RandomResizedCrop. Note: This transform is deprecated in favor of Resize. Optional center of rotation. Origin is the upper left corner. Default is the center of the image. Optional expansion flag. If true, expands the output to make it large enough to hold the entire rotated image. If false or omitted, make the output image the same size as the input image. Note that the expand flag assumes rotation around the center and no translation. Optional padding on each border of the image. Default is 0, i.e no padding. If a sequence of length 4 is provided, it is used to pad left, top, right, bottom borders respectively. Pad the given PIL Image on all sides with the given "pad" value. Padding on each border. If a single int is provided this is used to pad all borders. If tuple of length 2 is provided this is the padding on left/right and top/bottom respectively. If a tuple of length 4 is provided this is the padding for the left, top, right and bottom borders respectively. Pixel fill value. Default is 0. If a tuple of length 3, it is used to fill R, G, B channels respectively. Randomly change the brightness, contrast and saturation of an image. Randomly convert image to grayscale with a probability of p (default 0.1). Range of degrees to select from. If degrees is a number instead of sequence like (min, max), the range of degrees will be (-degrees, +degrees). Resize the input PIL Image to the given size. Rotate the image by angle. Sequence of means for each channel. Sequence of standard deviations for each channel. Tensor image of size (C, H, W) to be normalized. This transform returns a tuple of images and there may be a mismatch in the number of inputs and targets your Dataset returns. See below for an example of how to deal with this. Transforms are common image transforms. They can be chained together using :class:`Compose` Transforms on PIL Image Transforms on torch.\*Tensor Use vertical flipping instead of horizontal Vertically flip the given PIL Image randomly with a probability of 0.5. color space and pixel depth of input data (optional). If ``mode`` is ``None`` (default) there are some assumptions made about the input data: 1. If the input has 3 channels, the ``mode`` is assumed to be ``RGB``. 2. If the input has 4 channels, the ``mode`` is assumed to be ``RGBA``. 3. If the input has 1 channel, the ``mode`` is determined by the data type (i,e, ``int``, ``float``, ``short``). expected output size of each edge list of transforms to compose. probability that image should be converted to grayscale. range of aspect ratio of the origin aspect ratio cropped range of size of the origin size cropped torchvision.transforms 参数 返回 返回类型 Project-Id-Version: PyTorch master (0.3.0.post4 )
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-01-12 11:27+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh
Language-Team: zh <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 (1 or 3) number of channels desired for output image A crop of random size (default: of 0.08 to 1.0) of the original size and a random aspect ratio (default: of 3/4 to 4/3) of the original aspect ratio is made. This crop is finally resized to given size. This is popularly used to train the Inception networks. An optional resampling filter. See http://pillow.readthedocs.io/en/3.4.x/handbook/concepts.html#filters If omitted, or if the image has mode "1" or "P", it is set to PIL.Image.NEAREST. Apply a user-defined lambda as a transform. Composes several transforms together. Conversion Transforms Convert a ``PIL Image`` or ``numpy.ndarray`` to tensor. Convert a tensor or an ndarray to PIL Image. Convert image to grayscale. Converted image. Converts a PIL Image or numpy.ndarray (H x W x C) in the range [0, 255] to a torch.FloatTensor of shape (C x H x W) in the range [0.0, 1.0]. Converts a torch.*Tensor of shape C x H x W or a numpy ndarray of shape H x W x C to a PIL Image while preserving the value range. Crop the given PIL Image at a random location. Crop the given PIL Image into four corners and the central crop Crop the given PIL Image into four corners and the central crop plus the flipped version of these (horizontal flipping is used by default) Crop the given PIL Image to random size and aspect ratio. Crops the given PIL Image at the center. Default: PIL.Image.BILINEAR Desired interpolation. Default is ``PIL.Image.BILINEAR`` Desired output size of the crop. If size is an ``int`` instead of sequence like (h, w), a square crop of size (size, size) is made. Desired output size of the crop. If size is an int instead of sequence like (h, w), a square crop (size, size) is made. Desired output size. If size is a sequence like (h, w), output size will be matched to this. If size is an int, smaller edge of the image will be matched to this number. i.e, if height > width, then image will be rescaled to (size * height / width, size) Example Generic Transforms Grayscale version of the input image with probability p and unchanged with probability (1-p). - If input image is 1 channel: grayscale version is 1 channel - If input image is 3 channel: grayscale version is 3 channel with r == g == b Grayscale version of the input. - If num_output_channels == 1 : returned image is single channel - If num_output_channels == 3 : returned image is 3 channel with r == g == b Horizontally flip the given PIL Image randomly with a probability of 0.5. How much to jitter brightness. brightness_factor is chosen uniformly from [max(0, 1 - brightness), 1 + brightness]. How much to jitter contrast. contrast_factor is chosen uniformly from [max(0, 1 - contrast), 1 + contrast]. How much to jitter hue. hue_factor is chosen uniformly from [-hue, hue]. Should be >=0 and <= 0.5. How much to jitter saturation. saturation_factor is chosen uniformly from [max(0, 1 - saturation), 1 + saturation]. Image converted to PIL Image. Image to be converted to PIL Image. Image to be converted to tensor. Lambda/function to be used for transform. Normalize an tensor image with mean and standard deviation. Given mean: ``(M1,...,Mn)`` and std: ``(S1,..,Sn)`` for ``n`` channels, this transform will normalize each channel of the input ``torch.*Tensor`` i.e. ``input[channel] = (input[channel] - mean[channel]) / std[channel]`` Normalized Tensor image. Note: This transform is deprecated in favor of RandomResizedCrop. Note: This transform is deprecated in favor of Resize. Optional center of rotation. Origin is the upper left corner. Default is the center of the image. Optional expansion flag. If true, expands the output to make it large enough to hold the entire rotated image. If false or omitted, make the output image the same size as the input image. Note that the expand flag assumes rotation around the center and no translation. Optional padding on each border of the image. Default is 0, i.e no padding. If a sequence of length 4 is provided, it is used to pad left, top, right, bottom borders respectively. Pad the given PIL Image on all sides with the given "pad" value. Padding on each border. If a single int is provided this is used to pad all borders. If tuple of length 2 is provided this is the padding on left/right and top/bottom respectively. If a tuple of length 4 is provided this is the padding for the left, top, right and bottom borders respectively. Pixel fill value. Default is 0. If a tuple of length 3, it is used to fill R, G, B channels respectively. Randomly change the brightness, contrast and saturation of an image. Randomly convert image to grayscale with a probability of p (default 0.1). Range of degrees to select from. If degrees is a number instead of sequence like (min, max), the range of degrees will be (-degrees, +degrees). Resize the input PIL Image to the given size. Rotate the image by angle. Sequence of means for each channel. Sequence of standard deviations for each channel. Tensor image of size (C, H, W) to be normalized. This transform returns a tuple of images and there may be a mismatch in the number of inputs and targets your Dataset returns. See below for an example of how to deal with this. Transforms are common image transforms. They can be chained together using :class:`Compose` Transforms on PIL Image Transforms on torch.\*Tensor Use vertical flipping instead of horizontal Vertically flip the given PIL Image randomly with a probability of 0.5. color space and pixel depth of input data (optional). If ``mode`` is ``None`` (default) there are some assumptions made about the input data: 1. If the input has 3 channels, the ``mode`` is assumed to be ``RGB``. 2. If the input has 4 channels, the ``mode`` is assumed to be ``RGBA``. 3. If the input has 1 channel, the ``mode`` is determined by the data type (i,e, ``int``, ``float``, ``short``). expected output size of each edge list of transforms to compose. probability that image should be converted to grayscale. range of aspect ratio of the origin aspect ratio cropped range of size of the origin size cropped torchvision.transforms 参数 返回 返回类型 