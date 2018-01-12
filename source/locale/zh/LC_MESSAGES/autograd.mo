��    X      �              �     �     �     �     �  �  �  1   �  �   �  S  �  2   �	     
  -   ,
  W   Z
  �   �
  L   n  �   �  G   �  >   �  E     G   R  T   �  4   �  G   $  B   l  /   �  �  �     �  
   �  4   �       *  #  Z  N  <  �  �   �  �   ~  �   r  �   c  �   �  �   �  �   |     w      �  W   �  4     q   A  ?  �  �   �  ;   �  %   �     �  0        A  G   J     �  ^   �  �     8   �  L   �  �   =   v  !     ~"  P   �"  L   �"  _   ,#  �  �#  L  @%  �   �&  �   '  b   �'  3   �'  g   -(  �  �(  2   2*  -   e*     �*  �  �*  �   9,  W  �,  3   .     M.  8   i.  [  �.  '   �/     &0  �   ;0     *1     11     81  �  ?1     �2     �2     �2     3  �  &3  1   �4  �   �4  S  �5  2   7     A7  -   V7  W   �7  �   �7  L   �8  �   �8  G   �9  >   �9  E   6:  G   |:  T   �:  4   ;  G   N;  B   �;  /   �;  �  	<     �=  
   �=  4   �=     .>  *  M>  Z  x?  <  �@  �   B  �   �B  �   �C  �   �D  �   %E  �   �E  �   �F     �G      �G  W   �G  4   6H  q   kH  ?  �H  �   J  ;   �J  %   �J     "K  0   :K     kK  G   tK     �K  ^   �K  �   6L  8   �L  L   M  �   gM  v  1N     �O  P   �O  L   	P  _   VP  �  �P  L  jR  �   �S  �   9T  b   �T  3   #U  g   WU  �  �U  2   \W  -   �W     �W  �  �W  �   cY  W  �Y  3   C[     w[  8   �[  [  �[  '   (]     P]  �   e]     T^     [^     b^   :hidden:`Function` A FunctionEventAvg object. A string containing the table. API compatibility All :class:`Variable` s keep track of in-place operations applied to them, and if the implementation detects that a variable was saved for backward in one of the functions, but it was modified in-place afterwards, an error will be raised once backward pass is started. This ensures that if you're using in-place functions and not seeing any errors, you can be sure that the computed gradients are correct. An EventList containing FunctionEventAvg objects. Attribute used to sort entries. By default they are printed in the same order as they were registered. Valid keys include: ``cpu_time``, ``cuda_time``, ``cpu_time_total``, ``cuda_time_total``, ``count``. Autograd includes a profiler that lets you inspect the cost of different operators inside your model - both on the CPU and GPU. There are two modes implemented at the moment - CPU-only using :class:`~torch.autograd.profiler.profile`. and nvprof based (registers both CPU and GPU activity) using :class:`~torch.autograd.profiler.emit_nvtx`. Automatic differentiation package - torch.autograd Averages all events. Averages all function events over their keys. Boolean indicating if the Variable is a graph leaf (i.e if it was created by the user). Boolean indicating that the Variable should be used in inference mode, i.e. don't save the history. See :ref:`excluding-subgraphs` for more details. Can be changed only on leaf Variables. Boolean indicating whether the :func:`backward` will ever need to be called. Boolean indicating whether the Variable has been created by a subgraph containing any Variable, that requires it. See :ref:`excluding-subgraphs` for more details. Can be changed only on leaf Variables. Computes and returns the sum of gradients of outputs w.r.t. the inputs. Computes the gradient of current variable w.r.t. graph leaves. Computes the sum of gradients of given variables w.r.t. graph leaves. Context manager that makes every autograd operation emit an NVTX range. Context manager that manages autograd profiler state and holds a summary of results. Defines a formula for differentiating the operation. Detaches the Variable from the graph that created it, making it a leaf. Each function is meant to be used only once (in the forward pass). Enables .grad attribute for non-leaf Variables. Every operation performed on :class:`Variable` s creates a new function object, that performs the computation, and records that it happened. The history is retained in the form of a DAG of functions, with edges denoting data dependencies (``input <- output``). Then, when backward is called, the graph is processed in the topological ordering, by calling :func:`backward` methods of each :class:`Function` object, and passing returned gradients on to next :class:`Function` s. Example Examples:: Exports an EventList as a Chrome tracing tools file. Gradient function graph trace. Gradient w.r.t. the variable. If it is a tensor, it will be automatically converted to a Variable that is volatile unless ``create_graph`` is True. None values can be specified for scalar Variables or ones that don't require grad. If a None value would be acceptable then this argument is optional. Gradients w.r.t. each element of corresponding variables.  Any tensors will be automatically converted to Variables that are volatile unless ``create_graph`` is ``True``.  None values can be specified for scalar Variables or ones that don't require grad. If a None value would be acceptable for all grad_variables, then this argument is optional. Gradients w.r.t. each output. Any tensors will be automatically converted to Variables that are volatile unless ``create_graph`` is ``True``. None values can be specified for scalar Variables or ones that don't require grad. If a None value would be acceptable for all grad_variables, then this argument is optional. If ``False``, specifying inputs that were not used when computing outputs (and therefore their grad is always zero) is an error. Defaults to ``False``. If ``False``, the graph used to compute the grad will be freed. Note that in nearly all cases setting this option to ``True`` is not needed and often can be worked around in a much more efficient way. Defaults to the value of ``create_graph``. If ``False``, the graph used to compute the grads will be freed. Note that in nearly all cases setting this option to True is not needed and often can be worked around in a much more efficient way. Defaults to the value of ``create_graph``. If ``True``, gradient w.r.t. leaves that are part of the graph, but don't appear in ``inputs`` won't be computed and accumulated. Defaults to ``True``. If ``True``, graph of the derivative will be constructed, allowing to compute higher order derivative products. Defaults to ``False``, unless ``grad_variables`` contains at least one non-volatile Variable. If ``True``, graph of the derivative will be constructed, allowing to compute higher order derivative products. Defaults to ``False``, unless ``gradient`` is a volatile Variable. If ``only_inputs`` is ``True``, the function will only return a list of gradients w.r.t the specified inputs. If it's ``False``, then gradient w.r.t. all remaining leaves will still be computed, and will be accumulated into their ``.grad`` attribute. In-place correctness checks In-place operations on Variables Inputs w.r.t. which the gradient will be returned (and not accumulated into ``.grad``). It is useful when running the program under nvprof:: It must accept a context ctx as the first argument, followed by any number of arguments (tensors or other types). It must accept a context ctx as the first argument, followed by as many outputs did :func:`forward` return, and it should return as many tensors, as there were inputs to :func:`forward`. Each argument is the gradient w.r.t the given output, and each returned value should be the gradient w.r.t. the corresponding input. Normally, the only way users interact with functions is by creating subclasses and defining new operations. This is a recommended way of extending torch.autograd. Opens an nvprof trace file and parses autograd annotations. Path where the trace will be written. Performs the operation. Prints an EventList as a nicely formatted table. Profiler Records operation history and defines formulas for differentiating ops. Registers a backward hook. Result will never require gradient. If the input is volatile, the output will be volatile too. Returned Variable uses the same data tensor, as the original one, and in-place modifications on either of them will be seen, and may trigger errors in correctness checks. Returns a new Variable, detached from the current graph. Setting this to False makes this context manager a no-op. Default: ``True``. Since autograd only supports scalar valued function differentiation, grad size always matches the data size. Also, grad is normally only allocated for leaf variables, and will be always zero otherwise. Supporting in-place operations in autograd is a hard matter, and we discourage their use in most cases. Autograd's aggressive buffer freeing and reuse makes it very efficient and there are very few occasions when in-place operations actually lower memory usage by any significant amount. Unless you're operating under heavy memory pressure, you might never need to use them. Tensor to wrap. The checkpoint can be later loaded and inspected under ``chrome://tracing`` URL. The context can be used to retrieve variables saved during the forward pass. The context can be used to store variables that can be then retrieved during the backward pass. The graph is differentiated using the chain rule. If any of ``variables`` are non-scalar (i.e. their data has more than one element) and require gradient, the function additionally requires specifying ``grad_variables``. It should be a sequence of matching length, that contains gradient of the differentiated function w.r.t. corresponding variables (``None`` is an acceptable value for all variables that don't need gradient tensors). The graph is differentiated using the chain rule. If the variable is non-scalar (i.e. its data has more than one element) and requires gradient, the function additionally requires specifying ``gradient``. It should be a tensor of matching type and location, that contains the gradient of the differentiated function w.r.t. ``self``. The hook should not modify its argument, but it can optionally return a new gradient which will be used in place of :attr:`grad`. The hook will be called every time a gradient with respect to the variable is computed. The hook should have the following signature:: This function accumulates gradients in the leaves - you might need to zero them before calling it. This function is to be overriden by all subclasses. This function returns a handle with a method ``handle.remove()`` that removes the hook from the module. Unfortunately, there's no way to force nvprof to flush the data it collected to disk, so for CUDA profiling one has to use this context manager to annotate nvprof traces and wait for the process to exit before inspecting them. Then, either NVIDIA Visual Profiler (nvvp) can be used to visualize the timeline, or :func:`torch.autograd.profiler.load_nvprof` can load the results for inspection e.g. in Python REPL. Value of the requires_grad flag. **Keyword only.** Value of the volatile flag. **Keyword only.** Variable Variable API is nearly the same as regular Tensor API (with the exception of a couple in-place methods, that would overwrite inputs required for gradient computation). In most cases Tensors can be safely replaced with Variables and the code will remain to work just fine. Because of this, we're not documenting all the operations on variables, and you should refer to :class:`torch.Tensor` docs for this purpose. Variable holding the gradient of type and location matching the ``.data``.  This attribute is lazily allocated and can't be reassigned. Variable is a thin wrapper around a Tensor object, that also holds the gradient w.r.t. to it, and a reference to a function that created it. This reference allows retracing the whole chain of operations that created the data. If the Variable has been created by the user, its grad_fn will be ``None`` and we call such objects *leaf* Variables. Variables of which the derivative will be computed. Wrapped tensor of any type. Wraps a tensor and records the operations applied to it. ``grad_outputs`` should be a sequence of length matching ``output`` containing the pre-computed gradients w.r.t. each of the outputs. If an output doesn't require_grad, then the gradient can be ``None``). Gradients can be given as Tensors when one doesn't need the graph of the derivative, or as Variables, in which case the graph will be created. outputs of the differentiated function. path to nvprof trace torch.autograd provides classes and functions implementing automatic differentiation of arbitrary scalar valued functions. It requires minimal changes to the existing code - you only need to wrap all tensors in :class:`.Variable` objects. 参数 变量 返回 Project-Id-Version: PyTorch master (0.3.0.post4 )
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
 :hidden:`Function` A FunctionEventAvg object. A string containing the table. API compatibility All :class:`Variable` s keep track of in-place operations applied to them, and if the implementation detects that a variable was saved for backward in one of the functions, but it was modified in-place afterwards, an error will be raised once backward pass is started. This ensures that if you're using in-place functions and not seeing any errors, you can be sure that the computed gradients are correct. An EventList containing FunctionEventAvg objects. Attribute used to sort entries. By default they are printed in the same order as they were registered. Valid keys include: ``cpu_time``, ``cuda_time``, ``cpu_time_total``, ``cuda_time_total``, ``count``. Autograd includes a profiler that lets you inspect the cost of different operators inside your model - both on the CPU and GPU. There are two modes implemented at the moment - CPU-only using :class:`~torch.autograd.profiler.profile`. and nvprof based (registers both CPU and GPU activity) using :class:`~torch.autograd.profiler.emit_nvtx`. Automatic differentiation package - torch.autograd Averages all events. Averages all function events over their keys. Boolean indicating if the Variable is a graph leaf (i.e if it was created by the user). Boolean indicating that the Variable should be used in inference mode, i.e. don't save the history. See :ref:`excluding-subgraphs` for more details. Can be changed only on leaf Variables. Boolean indicating whether the :func:`backward` will ever need to be called. Boolean indicating whether the Variable has been created by a subgraph containing any Variable, that requires it. See :ref:`excluding-subgraphs` for more details. Can be changed only on leaf Variables. Computes and returns the sum of gradients of outputs w.r.t. the inputs. Computes the gradient of current variable w.r.t. graph leaves. Computes the sum of gradients of given variables w.r.t. graph leaves. Context manager that makes every autograd operation emit an NVTX range. Context manager that manages autograd profiler state and holds a summary of results. Defines a formula for differentiating the operation. Detaches the Variable from the graph that created it, making it a leaf. Each function is meant to be used only once (in the forward pass). Enables .grad attribute for non-leaf Variables. Every operation performed on :class:`Variable` s creates a new function object, that performs the computation, and records that it happened. The history is retained in the form of a DAG of functions, with edges denoting data dependencies (``input <- output``). Then, when backward is called, the graph is processed in the topological ordering, by calling :func:`backward` methods of each :class:`Function` object, and passing returned gradients on to next :class:`Function` s. Example Examples:: Exports an EventList as a Chrome tracing tools file. Gradient function graph trace. Gradient w.r.t. the variable. If it is a tensor, it will be automatically converted to a Variable that is volatile unless ``create_graph`` is True. None values can be specified for scalar Variables or ones that don't require grad. If a None value would be acceptable then this argument is optional. Gradients w.r.t. each element of corresponding variables.  Any tensors will be automatically converted to Variables that are volatile unless ``create_graph`` is ``True``.  None values can be specified for scalar Variables or ones that don't require grad. If a None value would be acceptable for all grad_variables, then this argument is optional. Gradients w.r.t. each output. Any tensors will be automatically converted to Variables that are volatile unless ``create_graph`` is ``True``. None values can be specified for scalar Variables or ones that don't require grad. If a None value would be acceptable for all grad_variables, then this argument is optional. If ``False``, specifying inputs that were not used when computing outputs (and therefore their grad is always zero) is an error. Defaults to ``False``. If ``False``, the graph used to compute the grad will be freed. Note that in nearly all cases setting this option to ``True`` is not needed and often can be worked around in a much more efficient way. Defaults to the value of ``create_graph``. If ``False``, the graph used to compute the grads will be freed. Note that in nearly all cases setting this option to True is not needed and often can be worked around in a much more efficient way. Defaults to the value of ``create_graph``. If ``True``, gradient w.r.t. leaves that are part of the graph, but don't appear in ``inputs`` won't be computed and accumulated. Defaults to ``True``. If ``True``, graph of the derivative will be constructed, allowing to compute higher order derivative products. Defaults to ``False``, unless ``grad_variables`` contains at least one non-volatile Variable. If ``True``, graph of the derivative will be constructed, allowing to compute higher order derivative products. Defaults to ``False``, unless ``gradient`` is a volatile Variable. If ``only_inputs`` is ``True``, the function will only return a list of gradients w.r.t the specified inputs. If it's ``False``, then gradient w.r.t. all remaining leaves will still be computed, and will be accumulated into their ``.grad`` attribute. In-place correctness checks In-place operations on Variables Inputs w.r.t. which the gradient will be returned (and not accumulated into ``.grad``). It is useful when running the program under nvprof:: It must accept a context ctx as the first argument, followed by any number of arguments (tensors or other types). It must accept a context ctx as the first argument, followed by as many outputs did :func:`forward` return, and it should return as many tensors, as there were inputs to :func:`forward`. Each argument is the gradient w.r.t the given output, and each returned value should be the gradient w.r.t. the corresponding input. Normally, the only way users interact with functions is by creating subclasses and defining new operations. This is a recommended way of extending torch.autograd. Opens an nvprof trace file and parses autograd annotations. Path where the trace will be written. Performs the operation. Prints an EventList as a nicely formatted table. Profiler Records operation history and defines formulas for differentiating ops. Registers a backward hook. Result will never require gradient. If the input is volatile, the output will be volatile too. Returned Variable uses the same data tensor, as the original one, and in-place modifications on either of them will be seen, and may trigger errors in correctness checks. Returns a new Variable, detached from the current graph. Setting this to False makes this context manager a no-op. Default: ``True``. Since autograd only supports scalar valued function differentiation, grad size always matches the data size. Also, grad is normally only allocated for leaf variables, and will be always zero otherwise. Supporting in-place operations in autograd is a hard matter, and we discourage their use in most cases. Autograd's aggressive buffer freeing and reuse makes it very efficient and there are very few occasions when in-place operations actually lower memory usage by any significant amount. Unless you're operating under heavy memory pressure, you might never need to use them. Tensor to wrap. The checkpoint can be later loaded and inspected under ``chrome://tracing`` URL. The context can be used to retrieve variables saved during the forward pass. The context can be used to store variables that can be then retrieved during the backward pass. The graph is differentiated using the chain rule. If any of ``variables`` are non-scalar (i.e. their data has more than one element) and require gradient, the function additionally requires specifying ``grad_variables``. It should be a sequence of matching length, that contains gradient of the differentiated function w.r.t. corresponding variables (``None`` is an acceptable value for all variables that don't need gradient tensors). The graph is differentiated using the chain rule. If the variable is non-scalar (i.e. its data has more than one element) and requires gradient, the function additionally requires specifying ``gradient``. It should be a tensor of matching type and location, that contains the gradient of the differentiated function w.r.t. ``self``. The hook should not modify its argument, but it can optionally return a new gradient which will be used in place of :attr:`grad`. The hook will be called every time a gradient with respect to the variable is computed. The hook should have the following signature:: This function accumulates gradients in the leaves - you might need to zero them before calling it. This function is to be overriden by all subclasses. This function returns a handle with a method ``handle.remove()`` that removes the hook from the module. Unfortunately, there's no way to force nvprof to flush the data it collected to disk, so for CUDA profiling one has to use this context manager to annotate nvprof traces and wait for the process to exit before inspecting them. Then, either NVIDIA Visual Profiler (nvvp) can be used to visualize the timeline, or :func:`torch.autograd.profiler.load_nvprof` can load the results for inspection e.g. in Python REPL. Value of the requires_grad flag. **Keyword only.** Value of the volatile flag. **Keyword only.** Variable Variable API is nearly the same as regular Tensor API (with the exception of a couple in-place methods, that would overwrite inputs required for gradient computation). In most cases Tensors can be safely replaced with Variables and the code will remain to work just fine. Because of this, we're not documenting all the operations on variables, and you should refer to :class:`torch.Tensor` docs for this purpose. Variable holding the gradient of type and location matching the ``.data``.  This attribute is lazily allocated and can't be reassigned. Variable is a thin wrapper around a Tensor object, that also holds the gradient w.r.t. to it, and a reference to a function that created it. This reference allows retracing the whole chain of operations that created the data. If the Variable has been created by the user, its grad_fn will be ``None`` and we call such objects *leaf* Variables. Variables of which the derivative will be computed. Wrapped tensor of any type. Wraps a tensor and records the operations applied to it. ``grad_outputs`` should be a sequence of length matching ``output`` containing the pre-computed gradients w.r.t. each of the outputs. If an output doesn't require_grad, then the gradient can be ``None``). Gradients can be given as Tensors when one doesn't need the graph of the derivative, or as Variables, in which case the graph will be created. outputs of the differentiated function. path to nvprof trace torch.autograd provides classes and functions implementing automatic differentiation of arbitrary scalar valued functions. It requires minimal changes to the existing code - you only need to wrap all tensors in :class:`.Variable` objects. 参数 变量 返回 