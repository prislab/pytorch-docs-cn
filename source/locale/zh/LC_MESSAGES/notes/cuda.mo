��          �               �    �  �   �  �   �  4   V     �     �  �   �     �  �   �  �   x  �   a  X     \  k  �   �	     �
  �   �
  {  �  t  !  �   �  �   |  .   
     9  �   S  (    �   7  �  �    P  �   \  �   <  4   �          -  �   <     .  �   C  �     �   �  X   �  \  �  �   [     O  �   a  {  8  t  �  �   )!  �   "  .   �"     �"  �   �"  (  �#  �   �$   :mod:`torch.cuda` is used to set up and run CUDA operations. It keeps track of the currently selected GPU, and all CUDA tensors you allocate will by default be created on that device. The selected device can be changed with a :any:`torch.cuda.device` context manager. Also, once you pin a tensor or storage, you can use asynchronous GPU copies. Just pass an additional ``async=True`` argument to a :meth:`~torch.Tensor.cuda` call. This can be used to overlap data transfers with computation. As of version 0.1.9, large numbers of GPUs (8+) might not be fully utilized. However, this is a known issue that is under active development. As always, test your use case. Below you can find a small example showcasing this:: Best practices CUDA semantics Cross-GPU operations are not allowed by default, with the only exception of :meth:`~torch.Tensor.copy_`. Unless you enable peer-to-peer memory access, any attempts to launch ops on tensors spread across different devices will raise an error. Device-agnostic code Due to the structure of PyTorch, you may need to explicitly write device-agnostic (CPU or GPU) code; an example may be creating a new tensor as the initial hidden state of a recurrent neural network. Host to GPU copies are much faster when they originate from pinned (page-locked) memory. CPU tensors and storages expose a :meth:`~torch.Tensor.pin_memory` method, that returns a copy of the object, with data put in a pinned region. However, once a tensor is allocated, you can do operations on it irrespective of the selected device, and the results will be always placed in on the same device as the tensor. If modules or tensors need to be sent to the GPU, ``args.cuda`` can be used as follows:: If you have a tensor and would like to create a new tensor of the same type on the same device, then you can use the :meth:`~torch.Tensor.new` method, which acts the same as a normal tensor constructor. Whilst the previously mentioned methods depend on the current GPU context, :meth:`~torch.Tensor.new` preserves the device of the original tensor. If you want to create a tensor of the same type and size of another tensor, and fill it with either ones or zeros, :meth:`~torch.ones_like` or :meth:`~torch.zeros_like` are provided as convenient helper functions (which also preserve device):: Memory management Most use cases involving batched inputs and multiple GPUs should default to using :class:`~torch.nn.DataParallel` to utilize more than one GPU. Even with the GIL, a single Python process can saturate multiple GPUs. PyTorch use a caching memory allocator to speed up memory allocations. This allows fast memory deallocation without device synchronizations. However, the unused memory managed by the allocator will still show as if used in `nvidia-smi`. Calling :meth:`~torch.cuda.empty_cache` can release all unused cached memory from PyTorch so that those can be used by other GPU applications. The first step is to determine whether the GPU should be used or not. A common pattern is to use Python's ``argparse`` module to read in user arguments, and have a flag that can be used to disable CUDA, in combination with :meth:`~torch.cuda.is_available`. In the following, ``args.cuda`` results in a flag that can be used to cast tensors and modules to CUDA if desired:: There are significant caveats to using CUDA models with :mod:`~torch.multiprocessing`; unless care is taken to meet the data handling requirements exactly, it is likely that your program will have incorrect or undefined behavior. This is the recommended practice when creating modules in which new tensors/variables need to be created internally during the forward pass:: Use nn.DataParallel instead of multiprocessing Use pinned memory buffers When creating tensors, an alternative to the if statement is to have a default datatype defined, and cast all tensors using that. An example when using a dataloader would be as follows:: When working with multiple GPUs on a system, you can use the ``CUDA_VISIBLE_DEVICES`` environment flag to manage which GPUs are available to PyTorch. As mentioned above, to manually control which GPU a tensor is created on, the best practice is to use a :any:`torch.cuda.device` context manager:: You can make the :class:`~torch.utils.data.DataLoader` return batches placed in pinned memory by passing ``pin_memory=True`` to its constructor. Project-Id-Version: PyTorch master (0.3.0.post4 )
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-01-12 11:13+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh
Language-Team: zh <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.5.1
 :mod:`torch.cuda` is used to set up and run CUDA operations. It keeps track of the currently selected GPU, and all CUDA tensors you allocate will by default be created on that device. The selected device can be changed with a :any:`torch.cuda.device` context manager. Also, once you pin a tensor or storage, you can use asynchronous GPU copies. Just pass an additional ``async=True`` argument to a :meth:`~torch.Tensor.cuda` call. This can be used to overlap data transfers with computation. As of version 0.1.9, large numbers of GPUs (8+) might not be fully utilized. However, this is a known issue that is under active development. As always, test your use case. Below you can find a small example showcasing this:: Best practices CUDA semantics Cross-GPU operations are not allowed by default, with the only exception of :meth:`~torch.Tensor.copy_`. Unless you enable peer-to-peer memory access, any attempts to launch ops on tensors spread across different devices will raise an error. Device-agnostic code Due to the structure of PyTorch, you may need to explicitly write device-agnostic (CPU or GPU) code; an example may be creating a new tensor as the initial hidden state of a recurrent neural network. Host to GPU copies are much faster when they originate from pinned (page-locked) memory. CPU tensors and storages expose a :meth:`~torch.Tensor.pin_memory` method, that returns a copy of the object, with data put in a pinned region. However, once a tensor is allocated, you can do operations on it irrespective of the selected device, and the results will be always placed in on the same device as the tensor. If modules or tensors need to be sent to the GPU, ``args.cuda`` can be used as follows:: If you have a tensor and would like to create a new tensor of the same type on the same device, then you can use the :meth:`~torch.Tensor.new` method, which acts the same as a normal tensor constructor. Whilst the previously mentioned methods depend on the current GPU context, :meth:`~torch.Tensor.new` preserves the device of the original tensor. If you want to create a tensor of the same type and size of another tensor, and fill it with either ones or zeros, :meth:`~torch.ones_like` or :meth:`~torch.zeros_like` are provided as convenient helper functions (which also preserve device):: Memory management Most use cases involving batched inputs and multiple GPUs should default to using :class:`~torch.nn.DataParallel` to utilize more than one GPU. Even with the GIL, a single Python process can saturate multiple GPUs. PyTorch use a caching memory allocator to speed up memory allocations. This allows fast memory deallocation without device synchronizations. However, the unused memory managed by the allocator will still show as if used in `nvidia-smi`. Calling :meth:`~torch.cuda.empty_cache` can release all unused cached memory from PyTorch so that those can be used by other GPU applications. The first step is to determine whether the GPU should be used or not. A common pattern is to use Python's ``argparse`` module to read in user arguments, and have a flag that can be used to disable CUDA, in combination with :meth:`~torch.cuda.is_available`. In the following, ``args.cuda`` results in a flag that can be used to cast tensors and modules to CUDA if desired:: There are significant caveats to using CUDA models with :mod:`~torch.multiprocessing`; unless care is taken to meet the data handling requirements exactly, it is likely that your program will have incorrect or undefined behavior. This is the recommended practice when creating modules in which new tensors/variables need to be created internally during the forward pass:: Use nn.DataParallel instead of multiprocessing Use pinned memory buffers When creating tensors, an alternative to the if statement is to have a default datatype defined, and cast all tensors using that. An example when using a dataloader would be as follows:: When working with multiple GPUs on a system, you can use the ``CUDA_VISIBLE_DEVICES`` environment flag to manage which GPUs are available to PyTorch. As mentioned above, to manually control which GPU a tensor is created on, the best practice is to use a :any:`torch.cuda.device` context manager:: You can make the :class:`~torch.utils.data.DataLoader` return batches placed in pinned memory by passing ``pin_memory=True`` to its constructor. 