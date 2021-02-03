import java.io.*;
import java.util.Arrays;

public class g22_lab3_rmse {
    public static void main(String[] args) {
        // ======= FILE TO ARRAYS: ======
        String actualValues = "";
        String estimatedValues = "";
        try {
            BufferedReader br_actual = new BufferedReader(new FileReader(new File("/Users/ilanahaddad/Documents/SCHOOL/McGill/Winter2020/325_Lab3/src/out.txt_scaled.txt")));
            BufferedReader br_estimated2 = new BufferedReader(new FileReader(new File("/Users/ilanahaddad/Documents/SCHOOL/McGill/Winter2020/325_Lab3/src/lab3-FIR-output.txt")));
            BufferedReader br_estimated = new BufferedReader(new FileReader(new File("/Users/ilanahaddad/Documents/SCHOOL/McGill/Winter2020/325_Lab3/src/lab3-broadcast-output.txt")));
            actualValues = br_actual.readLine();

            String line = br_estimated.readLine();
            while( line != null ){
                estimatedValues += line +" ";
                line  = br_estimated.readLine();
            }

            br_actual.close();
            br_estimated.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        String[] actual = actualValues.split(" ");
        String[] estimatedBinary = estimatedValues.split(" ");

        float[] actual_floats = new float[actual.length];
        for(int i = 0; i< actual.length; i++){
            actual_floats[i] = Float.parseFloat(actual[i]);
        }
        System.out.println("Actual = \t\t\t" + Arrays.toString(actual_floats));
        System.out.println("Estimated (Binary) = " + Arrays.toString(estimatedBinary));

        // ======= CONVERTING ESTIMATED VALUES FROM BINARY TO DECIMAL: =======

        int N = estimatedBinary.length;
        float[] estimatedDecimal = new float[N];
        for (int i = 0; i < estimatedBinary.length; i++){
            String binary = estimatedBinary[i];
            int decimal = Integer.parseInt(binary,2);
            estimatedDecimal[i] = decimal;

            estimatedDecimal[i] = decimal;

            if(binary.charAt(0) == '1'){ // negative numbers: subtract by 2^n
                estimatedDecimal[i] = (float) (estimatedDecimal[i] - Math.pow(2,binary.length()));
            }
            estimatedDecimal[i] = estimatedDecimal[i] / 49000;

        }
        System.out.println("Estimated (Decimal) = " +Arrays.toString(estimatedDecimal));

        /*
        Find RMSE for different bit widths of output signals
        RMS = sqrt(sum/N)
                sum = sum from 0 to N-1 of [(estimated -actual)^2]
         */
        float sum = 0;
        for(int i=0 ; i<N; i++){
            float temp = estimatedDecimal[i] - actual_floats[i];
            sum += Math.pow(temp, 2);
        }
        double RMS = Math.sqrt(sum/(N-1));
        System.out.println("RMS = " + RMS);
    }
}
