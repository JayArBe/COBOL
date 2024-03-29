      ******************************************************************
      * Author: Jan Ram�n Bl�cher
      * Date:29/01/2024
      * Purpose: learning
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. MoveTo.
       ENVIRONMENT DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
      *-----------------------
       INPUT-OUTPUT SECTION.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.

      *-----------------------
       WORKING-STORAGE SECTION.
       01 TEST-IDENTIFIER-1 PIC 99.
       01 TEST-IDENTIFIER-2 PIC S99 SIGN LEADING SEPARATE.
       01 TEST-IDENTIFIER-3 PIC X(12).

      *each digit is converted to binary when saving
       01 TEST-BINARY PIC 9(3) VALUE 123 USAGE IS BINARY.
       01 TEST-DEC PIC 9(3) VALUE 123 USAGE IS PACKED-DECIMAL.

      *DISPLAY is default. each digit is saved seperately + sign
       01 TEST-DISPLAY PIC 9(4) VALUE 123 USAGE IS DISPLAY.
       01 TEST-FLOAT PIC 9V999 VALUE 1.004.

      *when using the line "01 TEST-DATE PIC 99/99/99 VALUE 300124."
      *it still works and comes out as "30/01/24"
      *but the compiler will throw a warning
      *about expecting alphanumeric values
       01 TEST-DATE PIC 99/99/99 VALUE '30/01/24'.
      *same here
       01 TEST-DATE2 PIC 99B99B99 VALUE '30 01 24'.
      *"01 TEST-DATE PIC 9(8) VALUE '30/01/24'." would work the same.
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
           MOVE 1 TO TEST-IDENTIFIER-1
           MOVE 2 TO TEST-IDENTIFIER-2

           DISPLAY TEST-IDENTIFIER-1.
           DISPLAY TEST-IDENTIFIER-2.

           MOVE 3 TO TEST-IDENTIFIER-1 TEST-IDENTIFIER-2

           DISPLAY TEST-IDENTIFIER-1.
           DISPLAY TEST-IDENTIFIER-2.

           MOVE 11 TO TEST-IDENTIFIER-1
           MOVE 12 TO TEST-IDENTIFIER-2

           DISPLAY TEST-IDENTIFIER-1.
           DISPLAY TEST-IDENTIFIER-2.

           MOVE 'AA' TO TEST-IDENTIFIER-1
           MOVE 'AAA' TO TEST-IDENTIFIER-2

           DISPLAY TEST-IDENTIFIER-1.
           DISPLAY TEST-IDENTIFIER-2.

           MOVE 'ABC' TO TEST-IDENTIFIER-3

           DISPLAY TEST-IDENTIFIER-3.

      *TEST-IDENTIFIER-3 can only hold 12 signs so all others are cut off
           MOVE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' TO TEST-IDENTIFIER-3

           DISPLAY TEST-IDENTIFIER-3.

           MOVE 12 TO TEST-IDENTIFIER-1
           MOVE 13 TO TEST-IDENTIFIER-2


           DISPLAY TEST-BINARY.
           DISPLAY TEST-DEC.
           DISPLAY TEST-DISPLAY.

           MULTIPLY TEST-IDENTIFIER-1 BY TEST-IDENTIFIER-2
           GIVING TEST-DISPLAY

           DISPLAY TEST-DISPLAY.

           DISPLAY TEST-FLOAT.

           DISPLAY TEST-DATE.
           DISPLAY TEST-DATE2.


           STOP RUN.
       END PROGRAM MoveTo.
