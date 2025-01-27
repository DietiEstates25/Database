# TODO

***THIS FILE NEED TO BE DELETED BEFORE MERGING INTO MAIN***

## 24/01

### Dettagli trigger e aggiunte tabelle

- [x] Check ruoli in gerarchia
- [x] Check unico root per agenzia
- [x] Check stessa agenzia di super
- [x] Check tabelle per affitto controllare se ads_type è affitto
- [ ] Aggiungere timestamp a temporanee per autoeliminazione
- [ ] Gestione statistiche con trigger e clock (serve ancora con idea di materialized view?)

### Dettagli partizionamenti

- [ ] Partition address table
- [ ] Potenziale partizionamento tabella feature size

### Dettagli permessi d'accesso

- [ ] Aggiungere permessi d'accesso per utenti

### Dettagli stored procedures

- [ ] **Da espandere** Aggiungere stored procedures per query complesse

### Dettagli ulteriori

- [ ] Informarsi su estensione GIS per PostgreSQL
- [ ] Informarsi su estensione azioni on clock per PostgreSQL

## 27/01

### Dettagli partizionamenti 2

- [ ] Partition estate table on ads_type
