DECLARE
   v_nls_param   VARCHAR2(20);
   v_sql         VARCHAR2(200);
   v_nls_charset VARCHAR2(200) :='NLS_NCHAR_CHARACTERSET';
BEGIN 
  v_sql := 'SELECT VALUE FROM nls_database_parameters WHERE PARAMETER=:1';
  EXECUTE IMMEDIATE v_sql INTO v_nls_param USING v_nls_charset;
  IF ( v_nls_param in ('AL32UTF8', 'UTF8', 'AL16UTF16') ) THEN
INSERT ALL 
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1, 'ko', UNISTR('\007b\0031\007d\0020\007b\0032\007d\c774\0028\ac00\0029\0020\c874\c7ac\d558\c9c0\0020\c54a\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (2, 'ko', UNISTR('\007b\0031\007d\0020\007b\0032\007d\c774\0028\ac00\0029\0020\c874\c7ac\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (3, 'ko', UNISTR('\007b\0032\007d\0028\c73c\0029\b85c\0020\c778\d574\0020\007b\0031\007d\c744\0028\b97c\0029\0020\c2e4\d328\d588\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (4, 'ko', UNISTR('\bd80\c801\d569\d55c\0020\c785\b825\003a\0020\007b\0031\007d\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (5, 'ko', UNISTR('\c774\0020\b178\b4dc\c5d0\0020\b300\d55c\0020\c785\b825\0020\c18c\c2a4\ac00\0020\b370\c774\d130\b97c\0020\d3ec\d568\d558\c9c0\0020\c54a\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (6, 'ko', UNISTR('\b178\b4dc\ac00\0020\be48\0020\cd9c\b825\0020\acb0\acfc\b97c\0020\c0dd\c131\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (7, 'ko', UNISTR('\bd80\c801\d569\d55c\0020\be44\c6a9\0020\c774\c775\b960\0020\b9e4\d2b8\b9ad\c2a4\003a\0020\007b\0031\007d\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (8, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c774\0020\d558\b098\c758\0020\ace0\c720\0020\ac12\b9cc\0020\d3ec\d568\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (9, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c774\0020\cd5c\b300\0020\ace0\c720\0020\ac12\c744\0020\cd08\acfc\d569\b2c8\b2e4\002e\0020\d5c8\c6a9\b418\b294\0020\cd5c\b300\0020\ace0\c720\0020\ac12\0020\c218\b294\0020\007b\0032\007d\c785\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (10, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c774\0020\ace0\c720\0020\ac12\c744\0020\d3ec\d568\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (11, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c774\0020\004e\0055\004c\004c\0020\ac12\c744\0020\d3ec\d568\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (12, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c774\0020\baa8\b4e0\0020\acf5\ac04\0020\ac12\c744\0020\d3ec\d568\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (13, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c774\0020\baa8\b4e0\0020\004e\0055\004c\004c\0020\ac12\c744\0020\d3ec\d568\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (14, 'ko', UNISTR('\b370\c774\d130\0020\c720\d615\c774\0020\007b\0032\007d\c778\0020\007b\0031\007d\0020\b300\c0c1\c740\0020\007b\0033\007d\acfc\0028\c640\0029\0020\d638\d658\b418\c9c0\0020\c54a\c744\0020\c218\0020\c788\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (15, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c774\0020\ae30\c874\0020\baa8\b378\acfc\0020\d638\d658\b418\c9c0\0020\c54a\b294\0020\007b\0032\007d\0020\ac12\c744\0020\d3ec\d568\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (16, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c740\0020\b370\c774\d130\0020\c720\d615\0020\007b\0032\007d\acfc\0028\c640\0029\0020\d638\d658\b418\c9c0\0020\c54a\c2b5\b2c8\b2e4\0028\0020\0056\0041\0052\0043\0048\0041\0052\0032\002c\0020\0043\0048\0041\0052\002c\0020\004e\0055\004d\0042\0045\0052\0020\b610\b294\0020\0046\004c\004f\0041\0054\b9cc\0020\d5c8\c6a9\b429\b2c8\b2e4\0029\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (17, 'ko', UNISTR('\cf00\c774\c2a4\0020\0049\0044\0020\007b\0031\007d\c774\0028\ac00\0029\0020\ace0\c720\0020\ac12\c744\0020\d3ec\d568\d558\c9c0\0020\c54a\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (18, 'ko', UNISTR('\007b\0031\007d\0020\007b\0032\007d\c774\0028\ac00\0029\0020\b204\b77d\b418\c5c8\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (19, 'ko', UNISTR('\007b\0031\007d\0020\007b\0032\007d\c5d0\0020\b108\bb34\0020\b9ce\c740\0020\ace0\c720\0020\ac12\c774\0020\c788\c2b5\b2c8\b2e4\002e\0020\d5c8\c6a9\b418\b294\0020\cd5c\b300\0020\ace0\c720\0020\ac12\0020\c218\b294\0020\007b\0033\007d\c785\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (20, 'ko', UNISTR('\0047\004c\004d\c740\0020\c774\c9c4\0020\b300\c0c1\0020\c9c0\c815\b9cc\0020\d5c8\c6a9\d569\b2c8\b2e4\0028\0032\ac1c\c758\0020\ac12\0029\002e\0020\c120\d0dd\d55c\0020\b300\c0c1\0020\007b\0031\007d\c740\0028\b294\0029\0020\0032\ac1c\bcf4\b2e4\0020\b9ce\c740\0020\ac12\c744\0020\d3ec\d568\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (21, 'ko', UNISTR('\bd80\c801\d569\d55c\0020\c801\c6a9\0020\c18d\c131\003a\0020\007b\0031\007d\002e\0020\c18d\c131\c758\0020\b370\c774\d130\0020\c720\d615\c740\0020\007b\0032\007d\c774\c9c0\b9cc\002c\0020\007b\0033\007d\0020\baa8\b378\c744\0020\c0dd\c131\d558\b294\0020\b370\0020\c0ac\c6a9\b41c\0020\c18d\c131\c758\0020\b370\c774\d130\0020\c720\d615\c740\0020\007b\0034\007d\c785\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (22, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\0020\c2e4\d589\c774\0020\c0ac\c6a9\c790\c5d0\0020\c758\d574\0020\cde8\c18c\b418\c5c8\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (23, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\ac00\0020\c2e4\d589\0020\c911\c774\0020\c544\b2d9\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (24, 'ko', UNISTR('\007b\0031\007d\0020\c5f4\c5d0\0020\b300\d574\0020\c0dd\c131\b41c\0020\d14c\b9c8\ac00\0020\c5c6\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (25, 'ko', UNISTR('\baa8\b378\0020\c0dd\c131\c744\0020\c704\d55c\0020\ad50\c721\0020\b370\c774\d130\c5d0\0020\c608\ce21\0020\bcc0\c218\ac00\0020\c5c6\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (26, 'ko', UNISTR('\c785\b825\0020\c5f4\0020\007b\0031\007d\c740\0028\b294\0029\0020\b370\c774\d130\0020\c720\d615\0020\007b\0032\007d\acfc\0028\c640\0029\0020\d638\d658\b418\c9c0\0020\c54a\c2b5\b2c8\b2e4\0028\0020\0056\0041\0052\0043\0048\0041\0052\0032\002c\0020\0043\0048\0041\0052\002c\0020\004e\0055\004d\0042\0045\0052\0020\b610\b294\0020\0046\004c\004f\0041\0054\b9cc\0020\d5c8\c6a9\b429\b2c8\b2e4\0029\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (27, 'ko', UNISTR('\c785\b825\0020\c5f4\0020\007b\0031\007d\c740\0028\b294\0029\0020\b370\c774\d130\0020\c720\d615\0020\007b\0032\007d\acfc\0028\c640\0029\0020\d638\d658\b418\c9c0\0020\c54a\c2b5\b2c8\b2e4\0028\0020\0056\0041\0052\0043\0048\0041\0052\0032\002c\0020\0043\0048\0041\0052\002c\0020\004e\0055\004d\0042\0045\0052\002c\0020\0046\004c\004f\0041\0054\002c\0020\0044\004d\005f\004e\0045\0053\0054\0045\0044\005f\004e\0055\004d\0045\0052\0049\0043\0041\004c\0053\0020\b610\b294\0020\0044\004d\005f\004e\0045\0053\0054\0045\0044\005f\0043\0041\0054\0045\0047\004f\0052\0049\0043\0041\004c\0053\b9cc\0020\d5c8\c6a9\b429\b2c8\b2e4\0029\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (28, 'ko', UNISTR('\d14d\c2a4\d2b8\0020\bcc0\d658\c5d0\c11c\0020\c0ac\c6a9\b418\b294\0020\007b\0031\007d\0020\007b\0032\007d\c774\0028\ac00\0029\0020\b204\b77d\b418\c5c8\c2b5\b2c8\b2e4\002e\0020\d574\b2f9\d558\b294\0020\d14d\c2a4\d2b8\0020\c0dd\c131\0020\b178\b4dc\b97c\0020\c2e4\d589\d558\c5ec\0020\007b\0031\007d\c744\0028\b97c\0029\0020\c7ac\c0dd\c131\d558\c2ed\c2dc\c624\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (29, 'ko', UNISTR('\d3ec\d568\b41c\0020\c6cc\d06c\d50c\b85c\c6b0\ac00\0020\b2e4\b978\0020\c138\c158\c5d0\c11c\0020\c0ac\c6a9\b418\ac70\b098\0020\c2e4\d589\0020\c911\c774\bbc0\b85c\0020\d504\b85c\c81d\d2b8\0020\c0ad\c81c\b97c\0020\c2e4\d328\d588\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (30, 'ko', UNISTR('\d14c\c774\be14\0020\b610\b294\0020\bdf0\ac00\0020\d604\c7ac\0020\c0ac\c6a9\c790\c5d0\ac8c\0020\c9c1\c811\0020\ad8c\d55c\0020\bd80\c5ec\b418\c9c0\0020\c54a\c558\c2b5\b2c8\b2e4\002e\0020\c774\b85c\0020\c778\d574\0020\0044\0061\0074\0061\0020\004d\0069\006e\0065\0072\ac00\0020\bdf0\0020\c0dd\c131\c744\0020\c2dc\b3c4\d560\0020\b54c\0020\c2e4\d328\d560\0020\c218\0020\c788\c2b5\b2c8\b2e4\002e\0020\d14c\c774\be14\002f\bdf0\003a\0020\007b\0031\007d\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (31, 'ko', UNISTR('\b2e4\c74c\0020\b178\b4dc\c5d0\c11c\0020\c608\c0c1\ce58\0020\c54a\c740\0020\c624\b958\b85c\0020\c778\d574\0020\c6cc\d06c\d50c\b85c\c6b0\ac00\0020\c2e4\d328\d588\c2b5\b2c8\b2e4\002e\0020\c0dd\c131\b41c\0020\cf54\c5b4\0020\b364\d504\ac00\0020\c788\b294\c9c0\0020\ac80\d1a0\d558\c2ed\c2dc\c624\002e\0020\007b\0031\007d\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (32, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c740\0020\b370\c774\d130\0020\c720\d615\0020\007b\0032\007d\acfc\0028\c640\0029\0020\d638\d658\b418\c9c0\0020\c54a\c2b5\b2c8\b2e4\0028\0056\0041\0052\0043\0048\0041\0052\0032\002c\0020\0043\0048\0041\0052\002c\0020\004e\0055\004d\0042\0045\0052\002c\0020\0046\004c\004f\0041\0054\002c\0020\0042\0049\004e\0041\0052\0059\005f\0044\004f\0055\0042\004c\0045\0020\b610\b294\0020\0042\0049\004e\0041\0052\0059\005f\0046\004c\004f\0041\0054\b9cc\0020\d5c8\c6a9\b428\0029\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (33, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c740\0020\c22b\c790\0020\b370\c774\d130\0020\c720\d615\0020\007b\0032\007d\acfc\0028\c640\0029\0020\d638\d658\b418\c9c0\0020\c54a\c2b5\b2c8\b2e4\0028\004e\0055\004d\0042\0045\0052\0020\b610\b294\0020\0046\004c\004f\0041\0054\b9cc\0020\d5c8\c6a9\b428\0029\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (34, 'ko', UNISTR('\007b\0031\007d\0020\b300\c0c1\c740\0020\c22b\c790\0020\b370\c774\d130\0020\c720\d615\0020\007b\0032\007d\acfc\0028\c640\0029\0020\d638\d658\b418\c9c0\0020\c54a\c2b5\b2c8\b2e4\0028\004e\0055\004d\0042\0045\0052\002c\0020\0046\004c\004f\0041\0054\002c\0020\0042\0049\004e\0041\0052\0059\005f\0044\004f\0055\0042\004c\0045\0020\b610\b294\0020\0042\0049\004e\0041\0052\0059\005f\0046\004c\004f\0041\0054\b9cc\0020\d5c8\c6a9\b428\0029\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (35, 'ko', UNISTR('\c784\d3ec\d2b8\0020\c6cc\d06c\d50c\b85c\c6b0\0020\bc84\c804\0020\007b\0031\007d\c774\0028\ac00\0029\0020\c800\c7a5\c18c\c640\0020\d638\d658\b418\c9c0\0020\c54a\c2b5\b2c8\b2e4\002e\0020\c784\d3ec\d2b8\ac00\0020\c911\b2e8\b418\c5c8\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1000, 'ko', UNISTR('\b370\c774\d130\0020\c18c\c2a4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1001, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1002, 'ko', UNISTR('\bd84\c704\c218\0020\0042\0069\006e\006e\0069\006e\0067') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1003, 'ko', UNISTR('\c5f4\0020\c911\0020\d558\b098\c5d0\0020\cda9\bd84\d55c\0020\b370\c774\d130\ac00\0020\c5c6\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1004, 'ko', UNISTR('\0042\0069\006e\006e\0069\006e\0067\0020\ac80\c99d') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1005, 'ko', UNISTR('\b370\c774\d130\c5d0\0020\cda9\bd84\d55c\0020\ace0\c720\0020\ac12\c774\0020\c5c6\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1006, 'ko', UNISTR('\d14c\c774\be14') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1007, 'ko', UNISTR('\ac80\c99d') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1008, 'ko', UNISTR('\b204\b77d\0020\d14c\c774\be14\003a') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1009, 'ko', UNISTR('\c18d\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1010, 'ko', UNISTR('\b204\b77d\0020\c18d\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1011, 'ko', UNISTR('\c9d1\acc4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1012, 'ko', UNISTR('\d14c\c774\be14\0020\ac31\c2e0') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1013, 'ko', UNISTR('\c785\b825\c774\0020\c798\babb\b418\c5c8\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1014, 'ko', UNISTR('\bdf0') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1015, 'ko', UNISTR('\d14c\c774\be14\0020\b610\b294\0020\bdf0\0020\c0dd\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1016, 'ko', UNISTR('\d0d0\c0c9\0020\b370\c774\d130') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1017, 'ko', UNISTR('\c0dd\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1018, 'ko', UNISTR('\d14c\c2a4\d2b8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1019, 'ko', UNISTR('\c785\b825\0020\b370\c774\d130\ac00\0020\be44\c5b4\0020\c788\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1020, 'ko', UNISTR('\b300\c0c1') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1021, 'ko', UNISTR('\c18d\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1022, 'ko', UNISTR('\be44\d638\d658\0020\c785\b825\002f\b300\c0c1\002f\c0ac\b840\0020\0049\0044\0020\c18d\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1023, 'ko', UNISTR('\baa8\b378') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1024, 'ko', UNISTR('\b204\b77d\0020\baa8\b378') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1025, 'ko', UNISTR('\0047\004c\004d\c740\0020\c774\c9c4\0020\b300\c0c1\0020\c9c0\c815\b9cc\0020\d5c8\c6a9\d569\b2c8\b2e4\0028\0032\ac1c\c758\0020\ac12\0029\002e\0020\c120\d0dd\d55c\0020\b300\c0c1\c740\0020\0032\ac1c\bcf4\b2e4\0020\b9ce\c740\0020\ac12\c744\0020\d3ec\d568\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1026, 'ko', UNISTR('\bd80\c801\d569\d55c\0020\d56d\baa9\0020\ac12\0020\c18d\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1027, 'ko', UNISTR('\b204\b77d\0020\baa8\b378') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1028, 'ko', UNISTR('\c801\c6a9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1029, 'ko', UNISTR('\c218\d589\b41c\0020\ac80\c99d\0020\c5c6\c74c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1030, 'ko', UNISTR('\baa8\b378\0020\c138\bd80\0020\c815\bcf4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1031, 'ko', UNISTR('\d14c\c2a4\d2b8\0020\c138\bd80\0020\c815\bcf4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1032, 'ko', UNISTR('\d544\d130\0020\c138\bd80\0020\c815\bcf4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1033, 'ko', UNISTR('\ae30\b2a5\0020\d14c\c774\be14') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1034, 'ko', UNISTR('\c815\cc45') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1035, 'ko', UNISTR('\b809\c11c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1036, 'ko', UNISTR('\bd88\c6a9\0020\baa9\b85d') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1037, 'ko', UNISTR('\be44\d638\d658\0020\c0ac\b840\0020\0049\0044\0020\c18d\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1038, 'ko', UNISTR('\c5f4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1039, 'ko', UNISTR('\be44\d638\d658\0020\c5f4\0020\c18d\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1040, 'ko', UNISTR('\c870\c778') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1041, 'ko', UNISTR('\d14d\c2a4\d2b8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1042, 'ko', UNISTR('\bd84\d560') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1043, 'ko', UNISTR('\c5f4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1044, 'ko', UNISTR('\c0d8\d50c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1045, 'ko', UNISTR('\c5f4\0020\d544\d130') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1046, 'ko', UNISTR('\d589\0020\d544\d130') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1047, 'ko', UNISTR('\bcc0\d658') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1048, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\0020\c800\c7a5') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1049, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\ac00\0020\c0ac\c6a9\c790\c5d0\0020\c758\d574\0020\c7a0\ae30\c9c0\0020\c54a\c558\c2b5\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1050, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\0020\c2e4\d589') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1051, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\ac00\0020\c774\bbf8\0020\c2e4\d589\0020\c911\c785\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1052, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\ac00\0020\b2e4\b978\0020\c0ac\c6a9\c790\c5d0\0020\c758\d574\0020\c0ac\c6a9\b418\ac70\b098\0020\d604\c7ac\0020\c2e4\d589\0020\c911\c785\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1053, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\0020\c0ad\c81c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1054, 'ko', UNISTR('\d68c\adc0\0020\c0dd\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1055, 'ko', UNISTR('\bd84\b958\0020\c0dd\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1056, 'ko', UNISTR('\d14d\c2a4\d2b8\0020\c0dd\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1057, 'ko', UNISTR('\d14d\c2a4\d2b8\0020\c801\c6a9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1058, 'ko', UNISTR('\d14d\c2a4\d2b8\0020\cc38\c870\0020\c0dd\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1059, 'ko', UNISTR('\d56d\baa9\0020\ac12') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1060, 'ko', UNISTR('\d504\b85c\c81d\d2b8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1061, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\0020\c774\b984\0020\bc14\afb8\ae30') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1062, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0\0020\c815\c758\ac00\0020\bd80\c801\d569\d569\b2c8\b2e4\002e') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1063, 'ko', UNISTR('\c2dc\c791') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1064, 'ko', UNISTR('\c885\b8cc') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1065, 'ko', UNISTR('\c6cc\d06c\d50c\b85c\c6b0') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1066, 'ko', UNISTR('\b178\b4dc') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1067, 'ko', UNISTR('\d558\c704\0020\b178\b4dc') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1068, 'ko', UNISTR('\ac80\c99d') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1069, 'ko', UNISTR('\c0d8\d50c') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1070, 'ko', UNISTR('\ce90\c2dc') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1071, 'ko', UNISTR('\d1b5\acc4') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1072, 'ko', UNISTR('\ae30\b2a5') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1073, 'ko', UNISTR('\b370\c774\d130\0020\c900\be44') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1074, 'ko', UNISTR('\c0dd\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1075, 'ko', UNISTR('\d14c\c2a4\d2b8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1076, 'ko', UNISTR('\c801\c6a9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1077, 'ko', UNISTR('\bcc0\d658') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1078, 'ko', UNISTR('\d14d\c2a4\d2b8') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1079, 'ko', UNISTR('\d14d\c2a4\d2b8\0020\c0dd\c131') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1080, 'ko', UNISTR('\d14d\c2a4\d2b8\0020\c801\c6a9') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1081, 'ko', UNISTR('\cd9c\b825') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1082, 'ko', UNISTR('\c815\b9ac') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1083, 'ko', UNISTR('\b3d9\c801\0020\c608\ce21') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1084, 'ko', UNISTR('\b3d9\c801\0020\d074\b7ec\c2a4\d130') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1085, 'ko', UNISTR('\b3d9\c801\0020\ae30\b2a5') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1086, 'ko', UNISTR('\b3d9\c801\0020\bcc0\d615') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1087, 'ko', UNISTR('\0053\0051\004c\0020\c9c8\c758') )
 INTO ODMRSYS.ODMR$MESSAGES(message_id,language_id,message) VALUES (1088, 'ko', UNISTR('\adf8\b798\d504') )
SELECT * FROM DUAL; 
  END IF;
END;
/
