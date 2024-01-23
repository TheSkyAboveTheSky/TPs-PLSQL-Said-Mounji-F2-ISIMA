CREATE TABLE STATS_mounji (
  TypeMaj VARCHAR2(10),
  NbMaj NUMBER(5) DEFAULT 0,
  Date_derniere_Maj DATE
);
-----------------------
INSERT INTO STATS_mounji (TypeMaj, NbMaj, Date_derniere_Maj)
VALUES ('INSERT', 0, NULL);

INSERT INTO STATS_mounji (TypeMaj, NbMaj, Date_derniere_Maj)
VALUES ('UPDATE', 0, NULL);

INSERT INTO STATS_mounji (TypeMaj, NbMaj, Date_derniere_Maj)
VALUES ('DELETE', 0, NULL);
