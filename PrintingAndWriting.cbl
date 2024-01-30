      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. PrintingAndWriting.
       ENVIRONMENT DIVISION.


      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. DESKTOP-9VGD201.
       OBJECT-COMPUTER. DESKTOP-9VGD201.
      *-----------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

          SELECT PRINT-FILE ASSIGN TO 'FILE'.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.

       FD PRINT-FILE.
       01 REPORT-OUT PIC X(999).

      *-----------------------
       WORKING-STORAGE SECTION.

       01 PRINT-HEADERS.
         03 P-TITLE.
           05 P-TITLE-TXT PIC X(49) VALUE
           'Batch Control Program - Error Report. Page:'.
           05 P-PAGE-NO PIC Z9 VALUE ZERO.
         03 COL-HEAD-1 PIC X(31)
         VALUE 'PART CUST/DATE QUANT'.
         03 COL-HEAD-2 PIC X(24)
         VALUE 'NO SUP NO SUP/REC'.
       01 PRINT-LINE.
         03 P-PART-NO PIC X(8).
         03 PIC X VALUE SPACES.
         03 P-CUS-SUP-NO PIC X(6).
         03 PIC XX VALUE SPACES.
         03 P-DATE-S-D.
           05 P-DATE-1 PIC XX.
           05 PIC X VALUE '/'.
           05 P-DATE-2 PIC XX.
           05 PIC X VALUE '/'.
           05 P-DATE-3 PIC XX.
         03 PIC X VALUE SPACE.
         03 P-QUANT PIC Z(4)9.
       01 P-BATCH-REC.
         03 BAT-TITLE PIC X(38)
         VALUE 'HASH TOTALS IN BATCH CONTROL RECORD'.
         03 BATCH-SOURCE PIC x(29) VALUE SPACES.
         03 P-BAT-CUS-SUPP.
           05 BAT-CUS-SUPP PIC X(25)
           VALUE 'CUSTOMER/SUPPLIER NOS:'.
           05 BAT-C-S-N-TOT PIC Z(7)9 VALUE "12345678".
         03 P-BAT-DATE.
           05 BAT-DATE PIC X(9)
           VALUE 'DATES:'.
           05 BAT-D-S-D-TOT PIC Z(7)9 VALUE "7654321".
         03 P-BAT-QUANT.
           05 BAT-QUANT PIC X(14)
           VALUE 'QUANTITIES:'.
           05 BAT-Q-TOT PIC Z(7)9 VALUE "9876543".
         03 P-BAT-PART.
           05 BAT-PART PIC X(12)
           VALUE 'PART NOS:'.
           05 BAT-P-N-TOT PIC Z(7)9 VALUE "3456789".

       01 WS-REPORT-LINE PIC X(99).
      *-----------------------
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-

           OPEN OUTPUT PRINT-FILE.

           MOVE SPACES TO WS-REPORT-LINE.
           PERFORM PRINT-TITLE.
           MOVE SPACES TO WS-REPORT-LINE.
           PERFORM PRINT-COLUMN-HEADERS.
           MOVE SPACES TO WS-REPORT-LINE.
           PERFORM PRINT-DATA-LINE.


           MOVE SPACES TO WS-REPORT-LINE.
           PERFORM PRINT-BATCH-RECORD.

           CLOSE PRINT-FILE.

           STOP RUN.

       PRINT-TITLE.
           MOVE P-TITLE-TXT TO WS-REPORT-LINE.
           MOVE P-PAGE-NO TO WS-REPORT-LINE(51:2).
           MOVE WS-REPORT-LINE TO REPORT-OUT.
           WRITE REPORT-OUT.

       PRINT-COLUMN-HEADERS.
           MOVE COL-HEAD-1 TO WS-REPORT-LINE(1:31).
           MOVE COL-HEAD-2 TO WS-REPORT-LINE(32:24).

           MOVE WS-REPORT-LINE TO REPORT-OUT.
           WRITE REPORT-OUT.


       PRINT-DATA-LINE.
           MOVE "12345678" TO P-PART-NO.
           MOVE "CUST01" TO P-CUS-SUP-NO.
           MOVE "21" TO P-DATE-1.
           MOVE "06" TO P-DATE-2.
           MOVE "24" TO P-DATE-3.
           MOVE 1000 TO P-QUANT.

           MOVE P-PART-NO TO WS-REPORT-LINE(1:8).
           MOVE P-CUS-SUP-NO TO WS-REPORT-LINE(10:6).
           MOVE P-DATE-S-D TO WS-REPORT-LINE(17:8).
           MOVE P-QUANT TO WS-REPORT-LINE(26:5).
           MOVE WS-REPORT-LINE TO REPORT-OUT.
           WRITE REPORT-OUT.


       PRINT-BATCH-RECORD.
           MOVE BAT-TITLE TO WS-REPORT-LINE(1:38).
           MOVE BATCH-SOURCE TO WS-REPORT-LINE(40:29).
           MOVE WS-REPORT-LINE TO REPORT-OUT.
           WRITE REPORT-OUT.
           MOVE SPACES TO WS-REPORT-LINE.

           MOVE BAT-CUS-SUPP TO WS-REPORT-LINE(1:25).
           MOVE BAT-C-S-N-TOT TO WS-REPORT-LINE(26:7).
           MOVE BAT-DATE TO WS-REPORT-LINE(34:9).
           MOVE BAT-D-S-D-TOT TO WS-REPORT-LINE(44:7).
           MOVE BAT-QUANT TO WS-REPORT-LINE(52:14).
           MOVE BAT-Q-TOT TO WS-REPORT-LINE(67:7).
           MOVE BAT-PART TO WS-REPORT-LINE(75:12).
           MOVE BAT-P-N-TOT TO WS-REPORT-LINE(88:7).
           MOVE SPACES TO WS-REPORT-LINE(96:).
           MOVE WS-REPORT-LINE TO REPORT-OUT.
           WRITE REPORT-OUT.


       END PROGRAM PrintingAndWriting.
