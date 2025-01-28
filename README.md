# DietiEstate25 Database -
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#membri-del-gruppo)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Indice

- [Informazioni generali](#informazioni-generali)
  - [Membri del gruppo](#membri-del-gruppo)
- [Organizzazione del progetto](#organizzazione-del-progetto)
  - [Struttura della cartella src](#struttura-della-cartella-src)
    - [Descrizione delle cartelle](#descrizione-delle-cartelle)
- [Installazione](#installazione)
- [Requisiti](#requisiti)
- [Licenza](#licenza)

## Informazioni generali

- **Codice gruppo**: INGSW2425_07
- **Nome progetto**: DietiEstate25 Database
- **Membri del gruppo**: [Membri del gruppo](#membri-del-gruppo)
- **Docenti referenti progetto**: [Prof. Sergio di Martino](https://www.docenti.unina.it/#!/professor/53455247494f4449204d415254494e4f444d5253524737364232364638333952/riferimenti), [Prof. Luigi Lucio Libero Starace](https://www.docenti.unina.it/#!/professor/4c55494749204c494245524f204c5543494f535441524143455354524c4c4239314232354c3834354a/riferimenti)

### Membri del gruppo

Contribuzione al progetto ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<div style="width: 50%; margin-right: auto; margin-left: auto;"> 
  <table align="center">
    <tbody>
      <tr>
        <td align="center" valign="top" width="14.28%"><a href="https://github.com/RiccardoElena"><img src="https://avatars.githubusercontent.com/u/23059036?v=4?s=100" width="100px;" alt="Riccardo Elena"/><br /><sub><b>Riccardo Elena</b></sub></a><br /><a href="https://github.com/DietiEstates25/Database/commits/develop?author=RiccardoElena" title="Code">💻</a> <a href="#ideas-RiccardoElena" title="Ideas, Planning, & Feedback">🤔</a> <a href="#content-RiccardoElena" title="Content">🖋</a> <a href="https://github.com/DietiEstates25/Database/commits/develop?author=RiccardoElena" title="Documentation">📖</a></td>
        <td align="center" valign="top" width="14.28%"><a href="https://github.com/43616F73"><img src="https://avatars.githubusercontent.com/u/119624786?v=4?s=100" width="100px;" alt="43616F73"/><br /><sub><b>43616F73</b></sub></a><br /><a href="https://github.com/DietiEstates25/Database/commits/develop?author=43616F73" title="Code">💻</a> <a href="#ideas-43616F73" title="Ideas, Planning, & Feedback">🤔</a> <a href="#content-43616F73" title="Content">🖋</a> <a href="https://github.com/DietiEstates25/Database/commits/develop?author=43616F73" title="Documentation">📖</a></td>
      </tr>
    </tbody>
  </table>
</div>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

Questo progetto segue le specifiche di [all-contributors](https://GitHub.com/all-contributors/all-contributors).

## Organizzazione del progetto

Questa repository contiene il codice sorgente del Database per il progetto DietiEstate25.
Il DBMS utilizzato è PostgreSQL.

### Struttura della cartella src

La cartella `src` contiene i file SQL che compongono il database, oltre che ad uno script bash per la creazione automatica. La struttura della cartella è la seguente:

```bash
src
├── 00_db_infrastructure
│   ├── 00_base_infrastructure
│   │   ├── 00_schema.sql
│   │   ├── 01_domains.sql
│   │   ├── 02_enum_types.sql
│   │   ├── 03_common_tg_functions.sql
│   ├── 01_types
│   │   ├── 00_tables.sql
│   │   ├── 01_indexes.sql
│   │   ├── 02_population.sql
│   │   ├── 03_lock_triggers.sql
│   ├── 02_custom_errors
│   │   ├── 00_tables.sql
│   │   ├── 01_constraints.sql
│   │   ├── 02_functions.sql
│   │   ├── 03_population.sql
│   │   ├── 04_lock_triggers.sql
├── 01_db_business
│   ├── 00_tables.sql
│   ├── 01_indexes.sql
│   ├── 02_constraints.sql
│   ├── 03_tg_functions.sql
│   ├── 04_triggers.sql
├── 02_db_interface
│   ├── 00_functions.sql
│   ├── 01_views.sql
├── create_db.sh
```

#### Descrizione delle cartelle

- `00_db_infrastructure`: contiene la definizione delle tabelle d'infrastruttura, come errori custom e lookup table, oltre che a domini, enumerazioni etc.
Le tabelle in questa cartella sono utilizzate per la definizione delle tabelle di business e sono
bloccate per le operazioni di DML al di fuori della select.
- `01_db_business`: contiene la definizione delle tabelle di business, ovvero quelle che contengono i dati veri e propri del sistema, oltre che indici e trigger correlati.
- `02_db_interface`: contiene le funzioni e le viste utili ad interfacciarsi col database.

## Installazione

Sebbene sia possibile installare il database manualmente, è consigliato utilizzare lo script `create_db.sh` dalla cartella src per creare il database automaticamente, invocando il comando:

```bash
./create_db.sh
```

Per l'installazione manuale è necessario che i vari file siano eseguiti in ordine.

## Requisiti

- PostgreSQL 14.3
<!-- TODO: Aggiungere i requisiti delle estensioni di postgres -->

## Licenza

Questo progetto è rilasciato sotto licenza MIT. Per ulteriori informazioni, consultare il file [LICENSE](LICENSE).
