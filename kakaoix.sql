--------------------------------------------------------
--  파일이 생성됨 - 일요일-9월-02-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_PID
--------------------------------------------------------

   CREATE SEQUENCE  "KAKAOIX"."SEQ_PID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PNO
--------------------------------------------------------

   CREATE SEQUENCE  "KAKAOIX"."SEQ_PNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "KAKAOIX"."CART" 
   (	"ID" VARCHAR2(250 BYTE), 
	"PNO" NUMBER, 
	"QUANTITY" NUMBER DEFAULT 1
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "KAKAOIX"."MEMBER" 
   (	"ID" VARCHAR2(250 BYTE), 
	"PASSWORD" VARCHAR2(250 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"NICKNAME" VARCHAR2(30 BYTE), 
	"PHONE" NUMBER, 
	"POSTCODE" VARCHAR2(30 BYTE), 
	"ADDRESS" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "KAKAOIX"."PRODUCT" 
   (	"PNO" NUMBER, 
	"PNAME" VARCHAR2(4000 BYTE), 
	"PRICE" NUMBER, 
	"INTRO" VARCHAR2(4000 BYTE), 
	"STOCK" NUMBER, 
	"IMAGE" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRODUCT_DETAIL_IMG
--------------------------------------------------------

  CREATE TABLE "KAKAOIX"."PRODUCT_DETAIL_IMG" 
   (	"PNO" NUMBER, 
	"IMAGE" VARCHAR2(4000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PURCHASE_INF
--------------------------------------------------------

  CREATE TABLE "KAKAOIX"."PURCHASE_INF" 
   (	"PID" NUMBER, 
	"ID" VARCHAR2(250 BYTE), 
	"NAME" VARCHAR2(250 BYTE), 
	"PHONE" NUMBER, 
	"POSTCODE" VARCHAR2(30 BYTE), 
	"ADDRESS" VARCHAR2(250 BYTE), 
	"AMOUNT" NUMBER, 
	"PDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PURCHASE_LIST
--------------------------------------------------------

  CREATE TABLE "KAKAOIX"."PURCHASE_LIST" 
   (	"PID" NUMBER, 
	"PNO" NUMBER, 
	"QUANTITY" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into KAKAOIX.CART
SET DEFINE OFF;
REM INSERTING into KAKAOIX.MEMBER
SET DEFINE OFF;
REM INSERTING into KAKAOIX.PRODUCT
SET DEFINE OFF;
Insert into KAKAOIX.PRODUCT (PNO,PNAME,PRICE,INTRO,STOCK,IMAGE) values (1,'케이블바이트-어피치',9000,'귀여워서 숨 막히는 옆태! 소중한 케이블을 위해 준비했어요~<br>아이폰 라이트닝 케이블 전용 케이블 바이트입니다. <br>분리된 구멍에 케이블을 넣으면 안전하게 케이블을 보호할 수 있어요.<br><br>※ 아이폰 케이블만 호환됩니다.<br><br>-사이즈: 38*25*23mm / 28g<br>',30,'cable_apeach.jpg');
Insert into KAKAOIX.PRODUCT (PNO,PNAME,PRICE,INTRO,STOCK,IMAGE) values (2,'프렌즈랜드 캐슬 브릭',49000,'라이언이 지키고 있는 프렌즈 랜드 캐슬 브릭은 417개 피스로 구성되었습니다.<br>뚝딱뚝딱~ 튼튼한 프렌즈 캐슬을 직접 지어보세요!<br>캐슬 내부도 아기자기하게 꾸밀 수 있어요.',15,'friendsland_castle_brick.jpg');
Insert into KAKAOIX.PRODUCT (PNO,PNAME,PRICE,INTRO,STOCK,IMAGE) values (3,'프렌즈랜드 스트라이프 여성용-어피치',59900,'세안 밴드가 세트로 구성된 어피치 패턴 여성 파자마입니다.<br>프릴 디테일이 더해져 더욱 귀엽고 사랑스러워요.<br>오늘 밤, 프렌즈 꿈나라에서 꿀잠 예약 보장할게요.',25,'friendsland_stripe_apeach.jpg');
Insert into KAKAOIX.PRODUCT (PNO,PNAME,PRICE,INTRO,STOCK,IMAGE) values (4,'무선키보드-어피치',24900,'책상 위에 지저분한 코드는 이제 그만! 사랑스러운 색감과 귀여운 디자인, 키보드 위에서도 사랑스러운 카카오프렌즈를 만나보세요.<br>깜찍하고 컴팩트한 사이즈로 책상이 넒어지고 환해지는 마법을 경험하세요.<br>안정적이고 깔끔함 무선 키보드, 컴퓨터에 USB 나노 수신기만 꽂으면 끝!',14,'keyboard_apeach.jpg');
Insert into KAKAOIX.PRODUCT (PNO,PNAME,PRICE,INTRO,STOCK,IMAGE) values (5,'공부노트_라이언',3000,'공부노트는 유선이라 필기하기에 적당합니다.<br>프렌즈와 함께 열공하세요!<br><br>-매수: 60매<br><br>-크기: 약 18.8*25.6*0.5cm<br>',50,'studynote_lion.jpg');
Insert into KAKAOIX.PRODUCT (PNO,PNAME,PRICE,INTRO,STOCK,IMAGE) values (6,'리틀프렌즈 스프링노트_프렌즈만세',5000,'이모티콘에서 보던 리틀프렌즈가 스프링 노트로 출시되었어요.<br>빳빳한 표지와 넘기기 편한 스프링으로 만들어진 유선 노트입니다.<br>내지에 숨어있는 프렌즈를 찾아보세요.<br><br>-매수: 총 61매 (색지 1매 , 내지 60매)<br><br>-크기: 약 15.2*21*1.3cm',47,'springnote_friendsland.jpg');
Insert into KAKAOIX.PRODUCT (PNO,PNAME,PRICE,INTRO,STOCK,IMAGE) values (7,'20cm인형_케로',17000,'어렸을 적 북극 남극으로 입양 갔다가 스노우타운에서 다시 만난 쌍둥이 펭귄 케로와 베로니<br>이제는 어디를 가든 항상 붙어 다닙니다.<br>뻗친 머리가 귀여운 케로 인형입니다.<br>케로와 베로니의 방을 꾸밀 수 있도록 스티커와 대지가 함께 들어 있어요.<br>',19,'20cm_kero.jpg');
Insert into KAKAOIX.PRODUCT (PNO,PNAME,PRICE,INTRO,STOCK,IMAGE) values (8,'피규어 키링-커플네오',9000,'많은 사랑을 받았던 피규어 키링이 새로운 모습으로 출시되었어요!<br>한 손에 딱 들어오는 크기라 열쇠를 걸어 사용하거나 가방에 매달 수 있어요<br>프렌즈 공식 커플 네오와 프로도는 입술에 자석이 있어요.<br>가까이 다가가면 쪽~! 뽀뽀를 해요!<br><br>-권장사용연령: 15세 이상',8,'figure_keyring_couple_neo.jpg');
Insert into KAKAOIX.PRODUCT (PNO,PNAME,PRICE,INTRO,STOCK,IMAGE) values (9,'피규어 키링-커플프로도',9000,'많은 사랑을 받았던 피규어 키링이 새로운 모습으로 출시되었어요!<br>한 손에 딱 들어오는 크기라 열쇠를 걸어 사용하거나 가방에 매달 수 있어요<br>프렌즈 공식 커플 네오와 프로도는 입술에 자석이 있어요.<br>가까이 다가가면 쪽~! 뽀뽀를 해요!<br><br>-권장사용연령: 15세 이상',8,'figure_keyring_couple_frodo.jpg');
REM INSERTING into KAKAOIX.PRODUCT_DETAIL_IMG
SET DEFINE OFF;
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (1,'cable_apeach_1.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (1,'cable_apeach_2.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (1,'cable_apeach_3.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (1,'cable_apeach_4.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (1,'cable_apeach_5.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (1,'cable_apeach_6.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (2,'friendsland_castle_brick_1.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (2,'friendsland_castle_brick_2.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (2,'friendsland_castle_brick_3.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (2,'friendsland_castle_brick_4.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (2,'friendsland_castle_brick_5.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (3,'friendsland_stripe_apeach_1.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (3,'friendsland_stripe_apeach_2.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (3,'friendsland_stripe_apeach_3.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (3,'friendsland_stripe_apeach_4.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (4,'keyboard_apeach_1.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (4,'keyboard_apeach_2.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (4,'keyboard_apeach_3.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (4,'keyboard_apeach_4.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (5,'studynote_lion_1.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (5,'studynote_lion_2.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (5,'studynote_lion_3.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (5,'studynote_lion_4.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (6,'springnote_friendsland_1.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (6,'springnote_friendsland_2.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (6,'springnote_friendsland_3.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (6,'springnote_friendsland_4.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (7,'20cm_kero_1.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (7,'20cm_kero_2.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (7,'20cm_kero_3.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (7,'20cm_kero_4.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (7,'20cm_kero_5.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (7,'20cm_kero_6.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (8,'figure_keyring_couple_neo_1.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (8,'figure_keyring_couple_neo_2.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (8,'figure_keyring_couple_neo_3.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (8,'figure_keyring_couple_neo_4.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (8,'figure_keyring_couple_neo_5.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (9,'figure_keyring_couple_frodo_1.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (9,'figure_keyring_couple_frodo_2.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (9,'figure_keyring_couple_frodo_3.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (9,'figure_keyring_couple_frodo_4.jpg');
Insert into KAKAOIX.PRODUCT_DETAIL_IMG (PNO,IMAGE) values (9,'figure_keyring_couple_frodo_5.jpg');
REM INSERTING into KAKAOIX.PURCHASE_INF
SET DEFINE OFF;
REM INSERTING into KAKAOIX.PURCHASE_LIST
SET DEFINE OFF;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "KAKAOIX"."PRODUCT" ADD PRIMARY KEY ("PNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KAKAOIX"."PRODUCT" MODIFY ("STOCK" NOT NULL ENABLE);
  ALTER TABLE "KAKAOIX"."PRODUCT" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "KAKAOIX"."PRODUCT" MODIFY ("PNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "KAKAOIX"."MEMBER" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KAKAOIX"."MEMBER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "KAKAOIX"."MEMBER" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "KAKAOIX"."MEMBER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "KAKAOIX"."MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PURCHASE_INF
--------------------------------------------------------

  ALTER TABLE "KAKAOIX"."PURCHASE_INF" ADD PRIMARY KEY ("PID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "KAKAOIX"."PURCHASE_INF" MODIFY ("AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "KAKAOIX"."PURCHASE_INF" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "KAKAOIX"."PURCHASE_INF" MODIFY ("POSTCODE" NOT NULL ENABLE);
  ALTER TABLE "KAKAOIX"."PURCHASE_INF" MODIFY ("PHONE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "KAKAOIX"."CART" ADD CONSTRAINT "FK_CART_ID" FOREIGN KEY ("ID")
	  REFERENCES "KAKAOIX"."MEMBER" ("ID") ENABLE;
  ALTER TABLE "KAKAOIX"."CART" ADD CONSTRAINT "FK_CART_PNO" FOREIGN KEY ("PNO")
	  REFERENCES "KAKAOIX"."PRODUCT" ("PNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_DETAIL_IMG
--------------------------------------------------------

  ALTER TABLE "KAKAOIX"."PRODUCT_DETAIL_IMG" ADD CONSTRAINT "FK_PRODUCT" FOREIGN KEY ("PNO")
	  REFERENCES "KAKAOIX"."PRODUCT" ("PNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PURCHASE_INF
--------------------------------------------------------

  ALTER TABLE "KAKAOIX"."PURCHASE_INF" ADD CONSTRAINT "FK_PURCHASE_ID" FOREIGN KEY ("ID")
	  REFERENCES "KAKAOIX"."MEMBER" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PURCHASE_LIST
--------------------------------------------------------

  ALTER TABLE "KAKAOIX"."PURCHASE_LIST" ADD CONSTRAINT "FK_PURCHASE_PID" FOREIGN KEY ("PID")
	  REFERENCES "KAKAOIX"."PURCHASE_INF" ("PID") ENABLE;
  ALTER TABLE "KAKAOIX"."PURCHASE_LIST" ADD CONSTRAINT "FK_PURCHASE_PNO" FOREIGN KEY ("PNO")
	  REFERENCES "KAKAOIX"."PRODUCT" ("PNO") ENABLE;
