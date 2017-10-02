package br.com.analisador_lexico_compiladores;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;

import javax.swing.JFileChooser;

public class Language {

	public static void main(String[] args) throws IOException {
		
		String expr = "";
		
		JFileChooser fc = new JFileChooser();
		
		int returnVal = fc.showDialog(null, "Selecionar");
		
		if (returnVal == 0) {
			expr = (new Language()).readFile(fc.getSelectedFile());
		}
		
		LexicalAnalyzer lexicalAnalyzer = new LexicalAnalyzer(new StringReader(expr));
		lexicalAnalyzer.yylex();

	}

	private String readFile(File selectedFile) {
		
		StringBuffer sb = new StringBuffer();
		try(BufferedReader br = new BufferedReader(new FileReader(selectedFile))){
	
			String sCurrentLine;
			
			while ((sCurrentLine = br.readLine()) != null) {
					sb.append(sCurrentLine + "\n");
			}
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return sb.toString();
	}

}
