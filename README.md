# NextEpisode | Catalogo di serie TV

Piattaforma per il catalogo di serie TV, sviluppata come progetto finale individuale della specializzazione in PHP e Laravel di [Boolean](https://boolean.careers).

Questo repository contiene il **backoffice in Laravel** e le **API REST** che alimentano il sito pubblico, sviluppato in React in un repository separato: [next-episode-frontend](https://github.com/mattia-galasso/next-episode-frontend).

**🔗 Backoffice: [next-episode-backoffice.onrender.com](https://next-episode-backoffice.onrender.com)**
Accesso demo in sola lettura: `demo@nextepisode.it` / `Demo1234`

**🔗 Sito pubblico: [nextepisodedemo.netlify.app](https://nextepisodedemo.netlify.app)**

> Il backoffice è ospitato su un piano gratuito che va in pausa dopo un periodo di inattività, il primo caricamento può richiedere fino a un minuto.

## Funzionalità

- **Autenticazione** con Laravel Breeze
- **Ruoli e permessi** gestiti con le policy: amministratore con accesso completo, utente demo in sola lettura
- **Serie TV** con creazione, modifica ed eliminazione, caricamento di poster e banner
- **Cast** con assegnazione degli attori e del loro ruolo nella serie
- **Piattaforme di streaming** associate a ogni serie con il relativo link
- **Gestione** di attori, generi, piattaforme e case di produzione
- **Gestione utenti** con assegnazione dei ruoli, riservata all'amministratore
- **API REST** per il frontend, con elenco paginato e dettaglio tramite slug

## Database

| Relazione | Tipo |
|---|---|
| Casa di produzione → Serie TV | Uno a molti |
| Serie TV ↔ Generi | Molti a molti |
| Serie TV ↔ Piattaforme | Molti a molti, con link alla piattaforma |
| Serie TV ↔ Attori | Molti a molti, con ruolo dell'attore |

## API

| Endpoint | Descrizione |
|---|---|
| `GET /api/tvseries/homepage` | Serie in evidenza per la homepage |
| `GET /api/tvseries` | Elenco paginato delle serie |
| `GET /api/tvseries/{slug}` | Dettaglio di una serie con cast, generi e piattaforme |
| `GET /api/genres` | Elenco dei generi |
| `GET /api/platforms` | Elenco delle piattaforme |
| `GET /api/actors/{slug}` | Dettaglio di un attore |
| `GET /api/actors/search` | Ricerca degli attori |

## Stack

| Backend | Frontend | Database | Deploy |
|---|---|---|---|
| PHP 8.3, Laravel 12, Eloquent, Breeze, Blade, Bootstrap, Vite | React | MySQL | Render con Docker, Netlify, Aiven |

## Note sulla demo

L'account demo può consultare tutte le sezioni del backoffice ma non modificare i dati. Le immagini caricate dalla demo online non sono permanenti, perché l'hosting gratuito non mantiene i file tra un riavvio e l'altro.