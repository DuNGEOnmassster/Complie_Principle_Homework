%{

/* 这里声明语义动作符程序所需要的函数原型或者变量原型或定义等 */
/* 主要包含头文件，extern的全局变量，定义的全局变量等 */

#include <cstdio>
#include <cstring>

// 此文件定义了文法中终结符的类别
#include "parser.h"

%}

/* 使它不要添加默认的规则,这样输入无法被给定的规则完全匹配时，词法分析器可以报告一个错误 */
%option nodefault

/* 产生yywrap函数 */
%option noyywrap

/* flex 生成的扫描器用全局变量yylineno 维护着输入文件的当前行编号 */
%option yylineno

/* 区分大小写 */
%option case-sensitive

/* yytext的类型为指针类型，即char * */
%option pointer

/* 生成可重用的扫描器API，这些API用于多线程环境 */
/* %option reentrant */

%x COMMENT
/* 辅助定义式或者宏，后面使用时带上大括号 */

d			[0-9]
l           [a-zA-Z]
white		[\t\040]
white_line  [\r\n]

/* 正规式定义 */
%%
"/*"        {
                // 进入注释子有限自动机
                BEGIN(COMMENT); 
            }

<COMMENT>"*/" { 
                // 结束注释子有限自动机
                BEGIN(INITIAL); 
            }

<COMMENT>([^*]|\n)+|.  {
                ; // 注释子有限自动机中，忽略所有字符，含换行符等
            }

<COMMENT><<EOF>> {
                // 注释子有限自动机，没有遇到*/但是文件结束
                printf("Line %d: Unterminated comment\n", yylineno); 
                return YYerror; 
            }

"//".*\n    {
                ; // 忽略行注释
                printf(yytext);
            }

{d}+		{
                yylval.integer_num.val = (int)strtol(yytext, (char **)NULL, 10);
                yylval.integer_num.lineno = yylineno;
                return T_DIGIT;
            }

{l}+({d}|{l})* {
                strncpy(yylval.var_id.id, yytext, sizeof(yylval.var_id.id));
                yylval.var_id.lineno = yylineno;
                return T_ID;
            }

{d}+\.{d}*([Ee][+-]?{d}+)? {
                yylval.float_num.val = (double)atof(yytext);
                yylval.float_num.lineno = yylineno;
                return T_REAL;
            }

"("			{return T_LPAREN;}
")"			{return T_RPAREN;}

"*"			{return T_MUL;}
"+"			{return T_ADD;}

"="         {return T_ASSIGN;}
";"         {return T_SEMICOLON;}

"/"			{return T_DIV;}
"%"         {return T_MOD;}

"-"         {return T_SUB;}

{white}+	 ;

{white_line}+ ;

.			{
                printf("Line %d: Invalid char %s\n", yylineno, yytext);
                return YYUNDEF;
            }
%%
