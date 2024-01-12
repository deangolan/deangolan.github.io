%token <bool> BOOL 
%token SEP
%token OR
%token AND
%token NOT
%token IMP
%token IFF
%token LPAREN
%token RPAREN
%token EOF

%left IFF
%left IMP
%left AND
%left OR
%left NOT

%start <Ast.expr> prog

%%

prog:
    | e = expr; EOF { (e) }
    ;

expr:
    | b = BOOL { Bool b }
    | e1 = expr; OR; e2 = expr { Binop (Or, e1, e2) }
    | e1 = expr; AND; e2 = expr { Binop (And, e1, e2) }
    | e1 = expr; IMP; e2 = expr { Binop (Implies, e1, e2) }
    | e1 = expr; IFF; e2 = expr { Binop (Iff, e1, e2) }
    | NOT; e = expr { Not (e) }
    | LPAREN; e = expr; RPAREN { e } 
    ;
