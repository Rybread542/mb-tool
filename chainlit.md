# mbtool

This app serves as an exploratory tool into a minimized snapshot of the [MusicBrainz open source postgreSQL database.](https://musicbrainz.org/doc/MusicBrainz_Database) A small AI model is used to convert natural language into a database query.


## How to use it

Ask the bot to show you songs, albums, or artists based on a number of criteria you specify. The bot will then search the database and present you with a list of pseudorandom results.

### Available filters

You can make your questions more or less broad by adding certain filters, **limited to the following:**

- **Genre:** All broad genres as well as a few dozen subgenres.
- **Release year:** This database is a snapshot from roughly March of 2025. As such, the newest music will not appear in results.
- **Release type:** Several subtypes of release in addition to Album: Singles, Live performances, Compilations, EPs, Remixes, and DJ sets.
- **Artist nationality:** Country of origin of the *artist*, rather than where the music was recorded.
- **Track/Album duration**: displayed in minutes / seconds.
- **Track and album title, artist name:** Specific words or names can be matched in results.


For example, a simple broad album search: 
*Show me some 80s pop albums.*

Versus something more granular:
*Find some live reggae songs from between 1991 and 1994 that are at least 10 minutes long.*

### Limitations
The genre tags in the database are 100% crowdsourced, meaning they can vary wildly in number and quality per result. Tags are simple, broad genre descriptors, and as a result **the app cannot support the following types of questions**:
- Similarity: *Show me some artists like Tame Impala*
- Musical Qualities: *Find me some quiet, dreamy piano music*

Essentially, anything too abstract; the data does not go beyond the filters listed above.

Mess around with it. I hope you find something cool!

