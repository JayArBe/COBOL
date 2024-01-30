      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. YOUR-PROGRAM-NAME.
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
       01 NUMBER-SIZE PIC X.
      *level 88 = item BIG-NUMBER
       88 BIG-NUMBER VALUE 'Y'.
       01 DATA-NUMBER PIC 9(6) VALUE 3000.
      *-----------------------
       PROCEDURE DIVISION.

       INPUT-NUMBER-PARAGRAPH.
           MOVE 'N' TO NUMBER-SIZE.

           DISPLAY "START".
           IF DATA-NUMBER > 1000
             THEN MOVE 'Y' To NUMBER-SIZE
           END-IF.

           IF BIG-NUMBER
             THEN DISPLAY "That's a big number."
             ELSE DISPLAY "That's a little number."
           END-IF.
           DISPLAY "END".
           STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
