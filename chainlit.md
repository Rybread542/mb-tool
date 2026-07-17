# mb tool

This app serves as an exploratory tool into a minimized snapshot of the [MusicBrainz open-source postgreSQL database](https://musicbrainz.org/doc/MusicBrainz_Database) (roughly March 2025). A small AI model is used to convert natural language into a database query, allowing you to look pretty far into an otherwise very dense database.


## How to use it

Ask the chatbot to show you songs, albums, or artists based on a number of criteria you specify (*see below for criteria details!*). The chatbot will then search the database and present you with a list of pseudorandom results depending on the query.

### Available filters

You can narrow your searches in a number of specific ways using the guidelines below:

- **Genre:** All broad genres can be searched. There are a huge variety of subgenres, for example:
    - `pop rock`
    - `synth-pop`
    - `black metal`
    - `psychedelic rock`

    If you are unsure, you can always ask: 
    
    *`show me the top N tags in the database.`*
    <br/>
    <br/>

- **Release year:** Album or track release year up to the beginning of 2025:

    *`recommend some prog rock songs from 2015.`*

    This can also be used to roughly determine the "active years" of an artist:

    *`find some disco artists from the 90s.`*

    **Note**: *technically, this takes album remasters, etc. into account and can be inaccurate for literal active artist years.*
    <br/>
    <br/>

- **Release type:** When searching for albums, the default "release type" is Album, meaning a standard studio album. There exist however, several different types that can be searched:
    - `Single`
    - `EP`
    - `Live`
    - `Compilation`
    - `Remix`
    - `DJ mix`
    - `Demo`

    *`Recommend some deep house remixes from the 2000s.`*
    <br/>
    <br/>

- **Similar Artist:** Searches can be made for tracks, albums ot artist that are roughly "similar" to a given artist. 

    **Note**: The similarity calculation is based on an offshoot of MusicBrainz called ListenBrainz. Long story short, similarity is *artists which fans of the **given** artist **also** listen to.*

    For example:

    *`Show me some artists that are similar to Radiohead.`*
    
    This query returned: `The Cure, Pink Floyd, Aphex Twin, The Beatles` and others.
    
    These are artists one might expect a Radiohead fan to listen to, but musically they are all over the place. Therefore, if you're looking for **musically similar** tracks, albums, or artists, I'd highly recommend you include a revelant tag to narrow it a bit further:

    *`Show me some alternative rock artists that are similar to Radiohead.`*
    <br/>
    <br/>

- **Artist nationality:** Country of origin of the **artist**, rather than where the music was recorded:

    *`Show me some Korean hip hop artists.`*
    <br/>

- **Song/album duration:** Simple, but can make for some fun discovery:

    *`List some prog rock tracks longer than 15 minutes.`*
    <br/>

- **Exact names and titles:** Key words and/or names can be matched:

    *`List 5 songs by jazz artists named Rod.`*
    
    *`Find some psychedelic rock songs with 'turtle' in the title.`*
    <br/>


You can use any number of the above in any combination to search for music. However, **note that extremely specific searches are likely to return few or no results:**

*`Recommend some live, japanese cool jazz albums from 1993.`* 

The key is to hit a sweet spot of how narrow to make the search depending on what you're looking for.


## Limitations

### Data quality
The main limitation to this tool is that **the database is 100% crowd-sourced and maintained.** All genres and other metadata have slowly accumulated in the database over many years of people adding and updating the music.

So, what does this mean? The data is simply not perfect. **You may get results that seem odd or out of place from what you searched for.** A great example is The Beatles, who you may see often if you are searching for artists. If we take a look at all the tags that are attached to the Beatles, we have:

    adult alternative pop rock, art pop, art rock, baroque pop, beat, beat music, blues rock, british invasion, british psychedelia, british rhythm & blues, britpop, hard rock, heavy metal, indie rock, classic rock, europop, experimental, experimental rock, film soundtrack, folk pop, folk rock, folk-rock...

And that's only half of them. Technically, any time you search for artists under any of these genres, you have a chance at seeing them come up. 

### Searching based on musical qualities
Unfortunately, this is not possible in the current version of the app. As mentioned before, MusicBrainz tags are all user-generated, and do not have much in the way of actual sound qualities in the data. 

**As such, a query like the following:**

*`Find me some quiet, dreamy piano albums.`*

**is not currently supported, and will either return no results or error.**

This is the #1 functionality I would like to integrate into the data, but I am still looking into different options.


## Conclusion
Essentially, stick to the filters in the guide above for best results. You can technically ask it whatever you want, but it is designed to handle queries based on the existing data and will throw you errors for everything else.


Mess around with it. I hope you find something cool!

