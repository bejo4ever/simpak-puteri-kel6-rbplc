/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package encrypt;

/**
 *
 * @author holyknight
 */
public class Encrypt {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String plainText = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
        int textLength = plainText.length();
        int dimension = 8;
        System.out.println(textLength);
        String[][]test = new String[dimension][dimension];
        
        for(int i=1;i<=dimension;i++){
            for(int j=1;j<=dimension;j++){
                test[i][j] = String.valueOf(plainText.charAt(i));
          }
        }
    }
}
