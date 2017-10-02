package br.com.analisador_lexico_compiladores;

import java.io.File;
import java.nio.file.*;

public class Generator {

	public static void main(String[] args) {
		
		String rootPath = Paths.get("").toAbsolutePath().toString();
		String subPath  = "/src/br/com/analisador_lexico_compiladores/";
		String fileName = "language.lex";
		
		String file  = rootPath  + subPath + fileName;
		
		File sourceCode = new File(file);
		
		jflex.Main.generate(sourceCode);
		
		
	}

}
