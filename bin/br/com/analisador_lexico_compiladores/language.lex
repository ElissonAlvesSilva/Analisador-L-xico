package br.com.analisador_lexico_compiladores;


%%

%{

private void printToken(String description, String lexeme) {
		System.out.println(lexeme + "\t - \t" + description);
}
private void printToken(String description) {
		System.out.println(description);
}

private void unknownCharacter(String description){
	System.out.println(description);
}

%}

%class LexicalAnalyzer
%type void

EOL 				 = [\r|\n|\r\n]
NEWLINE			 = [\n]
TAB				 = [\t]
BLANK 			 = [\n| |\t|\r|\r\n]
ID 	  			 = [a-z|A-Z][a-z|A-Z|0-9]*

SUM   			 = "+"
SUB				 = "-"
MUL				 = "*"
DIV				 = "/"

INTEGER			 = 0|[1-9][0-9]*
FLOAT			 = (([0-9]+[.][0-9]*)|([0-9]*[.][0-9]+))
CHAR				 = ['][a-z|A-Z|a-z0-9][']
STRING 			 = ((['].[^\x]+[']) | ([\"].[^\x]+[\"]))
EMPTY_STRING		 = [']['] | [']{BLANK}*['] | [\"][\"] | [\"]{BLANK}*[\"]
COMMENT 		 	 = "/*" [^*] ~"*/" | "/*" "*" "/"



%%

"se"				{printToken("Reserved word if ", yytext());}
"senao"			{printToken("Reserved word else ", yytext());}
"para"			{printToken("Reserved word for ", yytext());}
"mostrar"		{printToken("Output function ", yytext());}
"ler"			{printToken("Input function ", yytext());}
"enquanto"		{printToken("Reserved word while ", yytext());}

"inteiro"		{printToken("Data integer type ", yytext());}
"real"			{printToken("Data float type ", yytext() );}

"{"				{printToken("block start ", yytext());}
"}"				{printToken("Block end ", yytext());}
";"				{printToken("End of instruction", yytext());}
"("				{printToken("Open parentheses ", yytext());}
")"				{printToken("Close parentheses ", yytext());}
"["				{printToken("Open bracket ", yytext());}
"]"				{printToken("Close bracket ", yytext());}


{NEWLINE}		{printToken("\\n \t - \tNew line scape");}
{TAB}			{printToken("\\t \t - \tTabulation scape ");}
{BLANK}			{printToken("Blank space ", yytext());}

{ID}				{printToken("Identificator ", yytext());}
{SUM}			{printToken("Sum operator ", yytext());}
{SUB}			{printToken("Subtraction operator ", yytext());}
{MUL}			{printToken("Multiplication operator ", yytext());}
{DIV}			{printToken("Division operator", yytext());}
{INTEGER}		{printToken("Integer number ", yytext());}
{FLOAT}			{printToken("Float number ",yytext());}
{CHAR}			{printToken("Character ", yytext());}
{STRING}			{printToken("String ", yytext());}
{EMPTY_STRING}	{printToken("Empty string ", yytext());}


{COMMENT}		{printToken("Comment ", yytext());}

"<"				{printToken("Less than operator ", yytext());}
">"				{printToken("Greater than operator ", yytext());}
"<="				{printToken("Less than or equal to operator ", yytext());}
">="				{printToken("Greater than or equal to operator ", yytext());}
"=="				{printToken("Equal to operator ", yytext());}
"="				{printToken("Attribution operator ", yytext());}

"||"			 	{printToken("OR operator ", yytext());}
"&&"				{printToken("AND operator ", yytext());}
"!="				{printToken("Not equal operator ", yytext());}
"!"				{printToken("Denial operator ", yytext());}

"++"				{printToken("Increment operator ", yytext());}
"--"				{printToken("Decrement operator ", yytext());}
","				{printToken("Concatenation operator ", yytext());}


.				{unknownCharacter(yytext() +"\t - \tUnknown character");}				






