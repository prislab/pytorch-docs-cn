��    	      d               �      �   �   �   '   �     �  C   �  -        ?  D   L  �  �       �   (  '   �     !  C   9  -   }     �  D   �   Best practices However in this case, the serialized data is bound to the specific classes and the exact directory structure used, so it can break in various ways when used in other projects, or after some serious refactors. Recommended approach for saving a model Serialization semantics The first (recommended) saves and loads only the model parameters:: The second saves and loads the entire model:: Then later:: There are two main approaches for serializing and restoring a model. Project-Id-Version: PyTorch master (0.3.0.post4 )
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
 Best practices However in this case, the serialized data is bound to the specific classes and the exact directory structure used, so it can break in various ways when used in other projects, or after some serious refactors. Recommended approach for saving a model Serialization semantics The first (recommended) saves and loads only the model parameters:: The second saves and loads the entire model:: Then later:: There are two main approaches for serializing and restoring a model. 