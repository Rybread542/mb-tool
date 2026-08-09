# mb tool 🎧

This app serves as an exploratory tool into a minimized snapshot (March 2025) of the [MusicBrainz open-source postgreSQL database](https://musicbrainz.org/doc/MusicBrainz_Database). A small locally run AI model is used to convert natural language into a database query, allowing you to look pretty far into a massive music database.


## How to use it 📝

Ask the bot for **artists**, **albums**, or **songs** along with a number of criteria you specify. The bot will search the database and present you with a group of random results based on your request.

This is not a standard chatbot in that it is **one input -> one output** and does not remember chat history. Its sole function is to search the database.

## Available filters

You can modify your searches in a few specific ways outlined below:

- 🎸**Genre:** Any broad genre you can think of is available, as well as a huge number of sub genres, for example:
    - `indie rock`
    - `synth-pop`
    - `black metal`
    - `cool jazz`
    - `deep house`

    *`folk rock albums.`*

    *`electro pop songs.`*

    If you are unsure, you can always ask: 
    
    *`show me the top N tags in the database.`*
    <br/>
    <br/>

- 🗓️**Release year:** Album or track release year up to the beginning of 2025:

    *`70s prog rock albums.`*

    *`recent indie rock songs.`*

    This can also be used to roughly determine the "active years" of an artist:

    *`90s disco artists.`*

    **Note**: *technically, this takes album remasters, deluxe editions, etc. into account and can be inaccurate for literal active artist years.*
    <br/>
    <br/>

- 🎤**Release type:** When searching for albums, the default "release type" is Album, meaning a standard studio album. There exist however several different release types that can be searched:
    - `Single`
    - `EP`
    - `Live`
    - `Compilation`
    - `Remix`
    - `DJ mix`
    - `Demo`

    *`deep house remixes from the 2000s.`*

    *`live metal performances from the 90s.`*
    <br/>
    <br/>

- 🧑‍🎤**Similar artist:** Searches can be performed for tracks, albums and artists that are roughly "similar" to a given artist. 

    The similarity calculation is taken from the [ListenBrainz](https://listenbrainz.org) dataset, which is a music logging service very similar to last.fm. Long story short, similarity is *artists which fans of the **given** artist **also** listen to.*

    For example:

    *`artists that are similar to Radiohead.`*
    
    This request gives us: 
    ```
    The Cure, Pink Floyd, Aphex Twin, The Beatles
    ``` 
    and others.
    
    These are artists one might expect a Radiohead fan to listen to, but musically they are all over the place. Therefore, if you're looking for **musically similar** tracks, albums, or artists, I'd highly recommend you include a relevant genre to narrow it a bit further:

    *`alternative rock artists that are similar to Radiohead.`*

    Unfortunately, artist similarity is limited in scope; there are only so many artists that actually have similar artist lists, and they tend to be the more popular ones. If you ask for music similar to a certain artist and get nothing back, that is likely why.
    <br/>
    <br/>

- 🗣️**Language:** *new!* Vocal language of the album or track (if any). 

    *`French pop rock songs.`*

    *`Classical albums sung in Portuguese.`*

    *`Swedish language metal albums.`*
    <br/>

- 🌎**Artist nationality:** Country of origin of the artist.

    *`Korean hip hop artists.`*

    *`Swedish metal bands.`*
    <br/>

- 🕒**Song/album duration:** Self explanatory, but can make for fun searches:

    *`trance tracks at least 10 minutes long.`*

    *`pop albums shorter than 30 minutes.`*

    *`rock artists with songs over 7 minutes on average.`*
    <br/>

- ✏️**Names and titles:** Key words and/or names can be matched:

    *`songs by jazz artists named Rodney.`*
    
    *`psychedelic rock songs with 'turtle' in the title.`*
    <br/>


You can use any number of the above in any combination to search for music. However, note that extremely specific searches are likely to return few or no results:

*`live italian doom metal performances from 1990.`* 

The key is to hit a sweet spot of how narrow to make the search depending on what you're looking for.


## Limitations 😔

### Data quality
The main limitation to this tool is that **the database is 100% crowd-sourced and maintained.** All genres and other metadata have slowly accumulated in the database over many years of people adding and updating the music.

What does this mean? The data is simply not perfect. **You may get results that seem odd or out of place for what you searched for.** A great example is The Beatles, who you may see often if you are searching for artists. If we take a look at all the tags that are attached to the Beatles, we have:

    adult alternative pop rock, art pop, art rock, baroque pop, beat, beat music, blues rock, british invasion, british psychedelia, british rhythm & blues, britpop, hard rock, heavy metal, indie rock, classic rock, europop, experimental, experimental rock, film soundtrack, folk pop, folk rock, folk-rock...

And that's only half of them. Technically, any time you search for artists under any of these genres, you have a chance at seeing them come up. 

### Searching based on musical qualities
Unfortunately, this is not possible in the current version of the app. As mentioned before, MusicBrainz tags are all user-generated, and do not have much in the way of actual sound qualities in the data. 

**As such, a query like the following:**

*`quiet, dreamy piano albums.`*

**is not currently supported, and will either return no results or error.**

This is the #1 functionality I would like to integrate into the data, but I am still looking into different options.

Also, this thing runs on an old 3060 in my closet and the database is gargantuan, so some queries make take a bit to come back. 

## Thanks🕺
Essentially, stick to the filters in the guide above for best results. You can technically ask it whatever you want, but it is designed to take music requests based on the existing data and will throw you errors for everything else.


Mess around with it. I hope you find something cool! 🎵

---

*Check this project out on [GitHub](https://github.com/Rybread542/mb-tool), or check out my [blog](https://rybread.dev) :)* 