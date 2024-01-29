      ******************************************************************
      * Author: Jan Ramón Blöcher
      * Date: 29/01/2024
      * Purpose: learning
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. FirstSubProgram.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'input.dat'
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRINT-FILE ASSIGN TO 'LPT1'.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
       FD INPUT-FILE.

       01 L-DATE-IN.
           03 MY-DAY PIC 99.
           03 MY-MONTH PIC 99.
           03 MY-YEAR PIC 9999.
      *-----------------------
       WORKING-STORAGE SECTION.
       01 END-OF-FILE PIC X VALUE 'N'.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
           DISPLAY "Beginning to read data from sub program".
           OPEN INPUT INPUT-FILE.

           PERFORM UNTIL END-OF-FILE = 'Y'
               READ INPUT-FILE
                   AT END
                       MOVE 'Y' TO END-OF-FILE
                   NOT AT END
                       DISPLAY 'Day: ' MY-DAY
                       DISPLAY 'Month: ' MY-MONTH
                       DISPLAY 'Year: ' MY-YEAR
               END-READ
           END-PERFORM.

           CLOSE INPUT-FILE.
           DISPLAY "Data read".

       END PROGRAM FirstSubProgram.
