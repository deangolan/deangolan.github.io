%token <string> PROP
%token <string> RULE
%token <bool> BOOL
%token COLON
%token OR
%token AND
%token NOT
%token IMP
%token IFF
%token LPAREN
%token RPAREN
%token PR
%token EOF


%left IFF
%left IMP
%left AND
%left OR
%right NOT

%start <Ast.expr option> prog


%%


prog:
    | EOF; { None }
    | e = expr; EOF { Some e }
    ;


expr:
    | p = PROP { Prop p }
    | b = BOOL { Bool b }
    | e1 = expr; OR; e2 = expr { Binop (Or, e1, e2) }
    | e1 = expr; AND; e2 = expr { Binop (And, e1, e2) }
    | e1 = expr; IMP; e2 = expr { Binop (Imp, e1, e2) }
    | e1 = expr; IFF; e2 = expr { Binop (Iff, e1, e2) }
    | NOT; e = expr { Not (e) }
    | LPAREN; e = expr; RPAREN { e } 
    ;
