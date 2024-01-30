Caml1999N033����            6interpreter/interp.mli����  
�    =  Ѡ����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,library-name�@�@@����&interp��.<command-line>A@A�A@G@@��A@@�A@H@@@@�@@�������@�@@@�@@�@@@@�@@@�@��������+SyntaxError��6interpreter/interp.mliA@J�A@U@�@������&string��A@Y�A@_@@��A@Y�A@_@@@@@��A@@�A@_@@���@@ ���@@ �A@��A@@�A@_@������+ParserError��"Cak�#Cav@�@�@@��'Caa�(Cav@@���@@ ���@@ �A@��-Caa�.Cav@������'SelfRef��7Ex B�8Ex I@�@������&string��BEx M�CEx S@@��EEx M�FEx S@@@@@��HExx�IEx S@@���@@ ���@@ �A@��NExx�OEx S@���Р$show��WG U Y�XG U ]@��@�����#Ast!t��cG U `�dG U e@@��fG U `�gG U e@@@����&string��nG U i�oG U o@@��qG U i�rG U o@@@��tG U `�uG U o@@@@@��wG U U�xG U o@��zG U U�{G U o@���Р(simplify���I q u��I q }@��@�����#Ast$prop���I q ���I q �@@���I q ���I q �@@@�����#Ast$prop���I q ���I q �@@���I q ���I q �@@@���I q ���I q �@@@@���)ocaml.doc��W@@ ��X@@ �A�������	u Simply a logical proposition by applying all possible operations to 
    booleans in the given abtract syntax tree. ���J � ���K �@@���J � ���K �@@@@���J � ���K �@@���J � ���K �@@���I q q��I q �@���I q q��I q �@���Р%parse���M��M@��@����&string���M��M#@@���M��M#@@@����$list���M-��M1@������#Ast!t���M'��M,@@���M'��M,@@@@���M'��M1@@@���M��M1@@@@���S���@@ ���@@ �A�������	� Parse a string representing a logical proof into a list of
    abstract syntax trees.
    @raise SyntaxError
    @raise Error 
    @raise SelfRef 
    @raise Invalid_argument ��N22�S��@@��	N22�
S��@@@@��N22�S��@@��N22�S��@@��M�M1@��M�M1@���Р&interp��U���U��@��@����&string��(U���)U��@@��+U���,U��@@@����&string��3U� �4U�@@��6U� �7U�@@@��9U���:U�@@@@�������@@ ���@@ �A�������	� Interpret a logical proof into a string indicating its validity.
    @raise SyntaxError 
    @raise Error
    @raise SelfRef 
    @raise Invalid_argument ��JV�KZ��@@��MV�NZ��@@@@��PV�QZ��@@��SV�TZ��@@��VU���WU�@��YU���ZU�@@