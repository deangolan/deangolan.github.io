%token <string> ATOM
%token <bool> BOOL
%token <int> INT
%token COMMA
%token OR
%token AND
%token NOT
%token IMP
%token IFF
%token LPAREN
%token RPAREN
%token PR
%token LE
%token IDM
%token COM
%token ASO
%token DIS
%token DN
%token DM
%token ID
%token DO
%token CON
%token TA
%token MP
%token MT
%token EOF

%left IFF
%right IMP
%left AND
%left OR
%right NOT

%start <(int * Ast.t list) option> main 
%type <int * Ast.t list> prog
%type <Ast.t> expr
%type <Ast.prop> prop

%%

main:
    | EOF { None }
    | p = prog { Some (fst p, List.rev (snd p)) }
    ;

prog:
    | EOF { (0, []) }
    | e = expr; p = prog { (fst p + 1, e :: snd p) }
    ;

expr:
    | p = prop; PR { Ast.Premise p }
    | q = prop; LE ; i = INT { Ast.EquivalenceRule (Rules.le, i, q) }
    | q = prop; IDM; i = INT { Ast.EquivalenceRule (Rules.idempotence, i, q) }
    | q = prop; COM; i = INT { Ast.EquivalenceRule (Rules.commutative, i, q) }
    | q = prop; ASO; i = INT { Ast.EquivalenceRule (Rules.associative, i, q) }
    | q = prop; DIS; i = INT { Ast.EquivalenceRule (Rules.distributive, i, q) }
    | q = prop; DN ; i = INT { Ast.EquivalenceRule (Rules.doublenegation, i, q) }
    | q = prop; DM ; i = INT { Ast.EquivalenceRule (Rules.demorgan, i, q) }
    | q = prop; ID ; i = INT { Ast.EquivalenceRule (Rules.identity, i, q) }
    | q = prop; DO ; i = INT { Ast.EquivalenceRule (Rules.dominance, i, q) }
    | q = prop; CON; i = INT { Ast.EquivalenceRule (Rules.contradiction, i, q) }
    | q = prop; TA ; i = INT { Ast.EquivalenceRule (Rules.tautology, i, q) }
    | q = prop; MP ; i1 = INT; COMMA; i2 = INT { Ast.ImplicationRule (Rules.modusponens, i1, i2, q) }
    | q = prop; MT ; i1 = INT; COMMA; i2 = INT { Ast.ImplicationRule (Rules.modustollens, i1, i2, q) }
    ;

prop:
    | a = ATOM { Atom a }
    | b = BOOL { Bool b }
    | p1 = prop; OR ; p2 = prop { Conn (Or, p1, p2) }
    | p1 = prop; AND; p2 = prop { Conn (And, p1, p2) }
    | p1 = prop; IMP; p2 = prop { Conn (Impl, p1, p2) }
    | p1 = prop; IFF; p2 = prop { Conn (Iff, p1, p2) }
    | NOT; p = prop { Not (p) }
    | LPAREN; p = prop; RPAREN { p }
    ;
