# Creazione e Gestione di Report e Dashboard Interattivi in Power BI

## 1. Creazione Tabelle Dimensioni e Fatti in Excel
Le Dimensioni sono tabelle statiche, mentre i Fatti sono tabelle dinamiche. Creare le tabelle in Excel e salvarle come file CSV.

## 2. Creazione del Database, delle Tabelle e Importazione Dati in SQL Server Management Studio (SSMS)

### 2.1 Creazione del Database

1. Aprire SQL Server Management Studio (SSMS) e connettersi al proprio server.
2. Cliccare con il tasto destro su "Databases" nel pannello di navigazione a sinistra.
3. Selezionare "New Database..." dal menu contestuale.
4. Nella finestra di dialogo che appare, inserire il nome del database (ad esempio, `BARS`) e cliccare su "OK".

### 2.2. Creazione delle Tabelle

1. Espandere il database appena creato nel pannello di navigazione a sinistra.
2. Cliccare con il tasto destro su "Tables" e selezionare "New Table...".
3. Definire le colonne della tabella:

   - **INT** per le chiavi primarie.
   - **FLOAT** per i numeri (ad esempio `amount`).
   - **DATE** per le date.
   - **NVARCHAR(250)** o **NVARCHAR(MAX)** per i testi (ad esempio le descrizioni delle note).
   - Spuntare i caratteri `null` se previsti nella colonna Excel.
   - Impostare una colonna come chiave primaria cliccando con il tasto destro sul nome della colonna e selezionando "Set Primary Key".
   - Cliccare due volte su "Identity Specification" per impostare su `YES`.

4. Dopo aver configurato le colonne, salvare la tabella con un nome (ad esempio, `DimDates`).
5. Ripetere i passaggi per creare altre tabelle come `FactInterventi` (tabella dei fatti) o `DimStrutture` (tabella delle dimensioni).

### 2.3. Importazione dei Dati

1. Cliccare con il tasto destro sul database (ad esempio, `CDSManteinances`) e selezionare "Tasks" > "Import Data...".
2. Nella finestra "SQL Server Import and Export Wizard":

   - **Data source:** FLAT FILE SOURCE
   - **Browse:** Selezionare il file CSV contenente la tabella da importare (creare un file CSV per ogni tabella).
   - **Advanced:** Sistemare le impostazioni (ad esempio, se una colonna è testo: **DataType:** text stream).
   - **Destination:** MICROSOFT OLE DB PROVIDER FOR SQL SERVER

3. Eseguire l'importazione cliccando su "Finish".

## 3. Utilizzo di Power BI per Importare e Analizzare i Dati

### 3.1. Importazione dei Dati da SQL Server

1. Aprire Power BI Desktop.
2. Andare su "Home" > "Ottieni dati" > "SQL Server".
3. Nella finestra di dialogo "Database SQL Server":

   - Inserire il nome del server e, se necessario, il nome del database (ad esempio, `CDSManteinances`).
   - Cliccare su "OK".

4. Selezionare le tabelle che si desidera importare (ad esempio, `DimDates` e `FactInterventi`).
5. Cliccare su "Carica" per importare i dati nel proprio modello di Power BI.

### 3.2. Verifica delle Relazioni

1. Andare alla vista "Modello" cliccando sull'icona del modello nel pannello a sinistra.
2. Verificare le relazioni tra le tabelle:

   - Se non sono già state create automaticamente, creare manualmente le relazioni (ad esempio trascinando il campo `DateID` dalla tabella `DimDates` e rilasciandolo sul campo `DataID` nella tabella `FactInterventi`).
   - Configurare la relazione come **uno-a-molti** (One-to-Many) se non è già configurata correttamente.

### 3.3. Creazione delle Misure

1. Andare alla vista "Dati" cliccando sull'icona dei dati nel pannello a sinistra.
2. Selezionare la tabella in cui si vogliono creare le misure (ad esempio, in `FactInterventi`).
3. Cliccare su "Nuova Misura" nella scheda "Modellazione" della barra degli strumenti.
4. Inserire le formule per le misure.

#### CONFRONTO TRA INTERVENTI SEGUITI DA UN MANUTENTORE ESTERNO E INTERNO:

- Aggiungi una colonna calcolata nella tabella “FactInterventi” per classificare gli interventi come esterni o interni:
  
  ```DAX
  Tipo_di_Intervento = 
  IF (
      FactInterventi[Necessità_di_Contattare_Ditte/Fornitori_Specializzati] = TRUE() || 
      FactInterventi[Monitoraggio_Intervento_Ditta_Esterna] = TRUE(), 
      "Esterno", 
      "Interno"
  )
```
- INTERVENTI ESTERNI:
Crea una nuova misura:

```DAX
InterventiEsterni = 
CALCULATE(
    COUNTROWS(FactInterventi),
    FactInterventi[Tipo_di_Intervento] = "Esterno"
)
```

- INTERVENTI INTERNI:
Crea una nuova misura:

```DAX
InterventiInterni = 
CALCULATE(
    COUNTROWS(FactInterventi),
    FactInterventi[Tipo_di_Intervento] = "Interno"
)
```



#### QUANTI INTERVENTI DI MANUTENZIONE ORDINARIA E NON ORDINARIA ANDIAMO A FARE:

- Crea una nuova colonna calcolata nella tabella che contiene “TipologieAttività”, quindi in “DimAttività”:
  
  ```DAX
  Tipologia_Attività_Filtro = 
  IF('DimAttività'[TipologiaAttività] = "Ordinaria", 
     "Ordinaria", 
     "Straordinaria"
  )
  ```

- Crea una nuova misura nella tabella “FactInterventi” per ottenere il numero totale degli interventi:

```DAX
Conteggio_Interventi = COUNT('FactInterventi'[InterventoID])
```
- Crea una misura per calcolare gli interventi ordinari:

```DAX
Conteggio_Interventi_Ordinari = 
CALCULATE(
    [Conteggio_Interventi],
    FILTER(
        'DimAttività', 
        'DimAttività'[Tipologia_Attività_Filtro] = "Ordinaria"
    )
)
```

- Crea una misura per calcolare gli interventi straordinari:

```DAX

Conteggio_Interventi_Straordinari = 
CALCULATE(
    [Conteggio_Interventi],
    FILTER(
        'DimAttività',
        'DimAttività'[Tipologia_Attività_Filtro] = "Straordinaria"
    )
)
```


#### TEMPO IMPIEGATO DAL MANUTENTORE:

- Crea una misura per il tempo totale impiegato:
  ```DAX
  Tempo_Totale_Impiegato = 
  SUM('FactInterventi'[Durata(minuti)])
```



- Crea una misura per il tempo medio impiegato:

```DAX
Tempo_Medio_Impiegato = 
AVERAGE('FactInterventi'[Durata(minuti)])
```

- Crea una misura per la deviazione dal tempo media:

```DAX
Deviazione_Tempo_Media = 
AVERAGEX(
    'FactInterventi',
    'FactInterventi'[Durata(minuti)] - RELATED('DimAttività'[Tempo_teorico_svolgimento_Attività])
)
```





# 3.4. Creazione e Formattazione dei Grafici

1. Andare alla vista "Report" cliccando sull'icona del report nel pannello a sinistra.
2. Selezionare il tipo di grafico (ad esempio, grafico a barre, grafico a torta).
3. Trascinare i campi e le misure appropriate nei riquadri "Asse", "Valori" e "Leggenda" del grafico.
4. Per formattare il grafico:
- Selezionare il grafico e usare il pannello "Visualizzazioni" per modificare colori, etichette e stile.
5. Aggiungere i filtri:
- Trascinare i campi nella sezione "Filtri" per applicare i filtri globali o locali ai grafici.