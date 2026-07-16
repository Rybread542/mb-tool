// public/elements/AlbumCards.jsx
//
// A responsive grid of album cards. Chainlit injects a global `props` object,
// which is whatever dict we passed from Python via cl.CustomElement(props=...).
// We expect props.albums to be a list of:
//   { title, artist, year, cover (image URL), mbUrl (link) }
//
// Styling is done with inline styles on purpose: Chainlit only bundles the
// subset of Tailwind classes it uses internally, so the full color palette
// isn't reliably available inside custom elements. Inline styles always work.

export default function AlbumCards() {
  const albums = (props && props.albums) || [];

  if (albums.length === 0) {
    return (
      <div style={{ padding: "12px", opacity: 0.7 }}>
        No albums to show.
      </div>
    );
  }

  return (
    <div
      style={{
        display: "grid",
        gridTemplateColumns: "repeat(auto-fill, minmax(160px, 1fr))",
        gap: "16px",
        width: "100%",
        padding: "8px 0",
      }}
    >
      {albums.map((a, i) => (
        <a
          key={i}
          href={a.mbUrl || "#"}
          target="_blank"
          rel="noopener noreferrer"
          style={{
            textDecoration: "none",
            color: "inherit",
            display: "flex",
            flexDirection: "column",
            borderRadius: "10px",
            overflow: "hidden",
            background: "rgba(127,127,127,0.08)",
            border: "1px solid rgba(127,127,127,0.18)",
            transition: "transform 0.12s ease",
          }}
          onMouseEnter={(e) => (e.currentTarget.style.transform = "translateY(-3px)")}
          onMouseLeave={(e) => (e.currentTarget.style.transform = "none")}
        >
          {/* Square cover area. A fallback glyph sits behind the image; if the
              image 404s (no art in the archive), onError hides it and the
              fallback shows through. No state/hooks needed. */}
          <div
            style={{
              position: "relative",
              width: "100%",
              aspectRatio: "1 / 1",
              background: "#2b2b33",
            }}
          >
            <div
              style={{
                position: "absolute",
                inset: 0,
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                fontSize: "32px",
                opacity: 0.5,
              }}
            >
              ♪
            </div>
            <img
              src={a.cover}
              alt={a.title}
              loading="lazy"
              onError={(e) => {
                e.currentTarget.style.display = "none";
              }}
              style={{
                position: "absolute",
                inset: 0,
                width: "100%",
                height: "100%",
                objectFit: "cover",
              }}
            />
          </div>

          {/* Text block */}
          <div
            style={{
              padding: "8px 10px",
              display: "flex",
              flexDirection: "column",
              gap: "2px",
            }}
          >
            <span
              title={a.title}
              style={{
                fontWeight: 600,
                fontSize: "13px",
                whiteSpace: "nowrap",
                overflow: "hidden",
                textOverflow: "ellipsis",
              }}
            >
              {a.title}
            </span>
            <span
              title={a.artist}
              style={{
                fontSize: "12px",
                opacity: 0.75,
                whiteSpace: "nowrap",
                overflow: "hidden",
                textOverflow: "ellipsis",
              }}
            >
              {a.artist}
            </span>
            {a.year ? (
              <span style={{ fontSize: "11px", opacity: 0.55 }}>{a.year}</span>
            ) : null}
          </div>
        </a>
      ))}
    </div>
  );
}