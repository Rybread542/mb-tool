// public/elements/DiscoveryCards.jsx
//
// One element for all discovery results. Props:
//   { kind: "albums" | "tracks" | "artists", items: [...], table: {...} }
// Uniform horizontal cards (cover left, two per row). Long names/titles
// scroll horizontally when they overflow. Expand a card for tags + service
// links (Spotify green/grey, MusicBrainz). A toggle flips to the raw table.

import { useState, useRef, useEffect } from "react";

const PRIMARY = { flex: 1, minWidth: 0, fontWeight: 600, fontSize: "14px" };
const ARTIST = { width: "100%", fontSize: "13px", opacity: 0.85 };
const ALBUM = { width: "100%", fontSize: "12px", opacity: 0.65 };
const SUB = { fontSize: "12px", opacity: 0.65 };
const META = { fontSize: "11px", opacity: 0.5 };

// Simple Icons CDN — correct brand logos, recolored via the URL.
const ICON = (slug, color) => `https://cdn.simpleicons.org/${slug}/${color}`;
const SPOTIFY_GREEN = "1DB954";
const ICON_GREY = "888888";
const MB_COLOR = "BA478F"; // MusicBrainz purple; change to taste

// --- Marquee: scrolls horizontally only when the text overflows ------------
function Marquee({ text, style }) {
  const outerRef = useRef(null);
  const innerRef = useRef(null);
  const [shift, setShift] = useState(0);

  useEffect(() => {
    const measure = () => {
      const outer = outerRef.current;
      const inner = innerRef.current;
      if (!outer || !inner) return;
      const diff = outer.clientWidth - inner.scrollWidth;
      setShift(diff < -2 ? diff : 0);
    };
    const raf = requestAnimationFrame(measure);
    window.addEventListener("resize", measure);
    return () => {
      cancelAnimationFrame(raf);
      window.removeEventListener("resize", measure);
    };
  }, [text]);

  const scrolling = shift < 0;
  const duration = scrolling ? Math.max(4, Math.abs(shift) / 22) : 0;

  const innerStyle = {
    display: "inline-block",
    whiteSpace: "nowrap",
    ...(scrolling
      ? { "--marquee-shift": `${shift}px`, animation: `dc-marquee ${duration}s linear infinite alternate` }
      : {}),
  };

  return (
    <div ref={outerRef} style={{ overflow: "hidden", ...style }}>
      <span ref={innerRef} title={text} style={innerStyle}>
        {text}
      </span>
    </div>
  );
}

function Tags({ tags }) {
  if (!tags || tags.length === 0) {
    return <span style={{ opacity: 0.5, fontSize: "12px" }}>No tags</span>;
  }
  return (
    <div style={{ display: "flex", flexWrap: "wrap", gap: "6px" }}>
      {tags.map((t, i) => (
        <span
          key={i}
          style={{ fontSize: "11px", padding: "2px 9px", borderRadius: "999px", background: "rgba(127,127,127,0.18)", whiteSpace: "nowrap" }}
        >
          {t}
        </span>
      ))}
    </div>
  );
}

function ServiceIcons({ item }) {
  const wrap = { display: "inline-flex", alignItems: "center", justifyContent: "center", padding: "6px", borderRadius: "8px", lineHeight: 0 };
  const img = (src, alt) => <img src={src} alt={alt} width="24" height="24" style={{ display: "block" }} />;

  const spotify = item.spotifyUrl ? (
    <a href={item.spotifyUrl} target="_blank" rel="noopener noreferrer" title="Open in Spotify" onClick={(e) => e.stopPropagation()} style={wrap}>
      {img(ICON("spotify", SPOTIFY_GREEN), "Spotify")}
    </a>
  ) : (
    <span title="No Spotify link found" style={{ ...wrap, cursor: "not-allowed" }}>
      {img(ICON("spotify", ICON_GREY), "Spotify")}
    </span>
  );

  const mb = item.mbUrl ? (
    <a href={item.mbUrl} target="_blank" rel="noopener noreferrer" title="Open in MusicBrainz" onClick={(e) => e.stopPropagation()} style={wrap}>
      {img(ICON("musicbrainz", MB_COLOR), "MusicBrainz")}
    </a>
  ) : (
    <span title="No MusicBrainz link" style={{ ...wrap, cursor: "not-allowed" }}>
      {img(ICON("musicbrainz", ICON_GREY), "MusicBrainz")}
    </span>
  );

  return (
    <div style={{ flex: "0 0 110px", display: "flex", alignItems: "center", justifyContent: "center", gap: "10px" }}>
      {spotify}
      {mb}
    </div>
  );
}

function ExpandPanel({ item }) {
  return (
    <div style={{ display: "flex", gap: "12px", padding: "10px 12px", borderTop: "1px solid rgba(127,127,127,0.18)" }}>
      <div style={{ flex: 1, minWidth: 0 }}>
        <div style={{ fontSize: "10px", opacity: 0.5, marginBottom: "6px", textTransform: "uppercase", letterSpacing: "0.6px" }}>
          Tags
        </div>
        <div style={{ maxHeight: "96px", overflowX: "auto", overflowY: "auto" }}>
          <Tags tags={item.tags} />
        </div>
      </div>
      <ServiceIcons item={item} />
    </div>
  );
}

function Cover({ cover, fallback }) {
  return (
    <div style={{ position: "relative", background: "#2b2b33", width: "96px", minHeight: "96px", alignSelf: "stretch", flex: "0 0 auto" }}>
      <div style={{ position: "absolute", inset: 0, display: "flex", alignItems: "center", justifyContent: "center", fontSize: "24px", fontWeight: 600, opacity: 0.5 }}>
        {fallback || "\u266A"}
      </div>
      {cover ? (
        <img
          src={cover}
          alt=""
          loading="lazy"
          onError={(e) => { e.currentTarget.style.display = "none"; }}
          style={{ position: "absolute", inset: 0, width: "100%", height: "100%", objectFit: "cover" }}
        />
      ) : null}
    </div>
  );
}

function TextStack({ kind, it, chevron }) {
  const primary = (text) => (
    <div style={{ display: "flex", alignItems: "center" }}>
      <Marquee text={text} style={PRIMARY} />
      {chevron}
    </div>
  );

  if (kind === "artists") {
    return (
      <>
        {primary(it.artist)}
        {it.nationality ? <span style={SUB}>{it.nationality}</span> : null}
      </>
    );
  }
  if (kind === "albums") {
    return (
      <>
        {primary(it.title)}
        <Marquee text={it.artist} style={ARTIST} />
        {it.year ? <span style={META}>{[it.year, it.duration].filter(Boolean).join("  \u00B7  ")}</span> : null}
      </>
    );
  }
  return (
    <>
      {primary(it.track)}
      <Marquee text={it.artist} style={ARTIST} />
      <Marquee text={it.album} style={ALBUM} />
      <span style={META}>{[it.year, it.duration].filter(Boolean).join("  \u00B7  ")}</span>
    </>
  );
}

function DataTable({ table }) {
  if (!table || !table.columns) return null;
  return (
    <div style={{ width: "100%", overflowX: "auto" }}>
      <table style={{ borderCollapse: "collapse", width: "100%", fontSize: "12px" }}>
        <thead>
          <tr>
            {table.columns.map((c, i) => (
              <th key={i} style={{ textAlign: "left", padding: "6px 10px", borderBottom: "1px solid rgba(127,127,127,0.3)", whiteSpace: "nowrap", opacity: 0.7, fontWeight: 600 }}>
                {c}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {table.rows.map((row, ri) => (
            <tr key={ri}>
              {row.map((cell, ci) => (
                <td key={ci} style={{ padding: "6px 10px", borderBottom: "1px solid rgba(127,127,127,0.12)", verticalAlign: "top" }}>
                  {cell}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
      {table.truncated ? (
        <div style={{ fontSize: "11px", opacity: 0.5, padding: "6px 2px" }}>
          showing first {table.rows.length} of {table.total} rows
        </div>
      ) : null}
    </div>
  );
}

function CardGrid({ kind, items }) {
  const [open, setOpen] = useState({});
  const toggle = (i) => setOpen((p) => ({ ...p, [i]: !p[i] }));

  const cardStyle = {
    display: "flex",
    flexDirection: "column",
    borderRadius: "10px",
    overflow: "hidden",
    background: "rgba(127,127,127,0.08)",
    border: "1px solid rgba(127,127,127,0.18)",
  };

  return (
    <div style={{ display: "grid", gridTemplateColumns: "repeat(2, 1fr)", gap: "10px", alignItems: "start", width: "100%" }}>
      {items.map((it, i) => {
        const expanded = !!open[i];
        const chevron = (
          <span style={{ opacity: 0.5, fontSize: "12px", paddingLeft: "8px", transform: expanded ? "rotate(180deg)" : "none", transition: "transform 0.15s ease" }}>
            {"\u25BE"}
          </span>
        );
        const fallback = kind === "artists" && it.artist ? it.artist.trim().charAt(0).toUpperCase() : "\u266A";

        return (
          <div key={i} style={cardStyle}>
            <div onClick={() => toggle(i)} style={{ cursor: "pointer", display: "flex", flexDirection: "row", alignItems: "stretch" }}>
              <Cover cover={it.cover} fallback={fallback} />
              <div style={{ display: "flex", flexDirection: "column", justifyContent: "center", gap: "2px", padding: "10px 14px", minWidth: 0, flex: 1 }}>
                <TextStack kind={kind} it={it} chevron={chevron} />
              </div>
            </div>
            {expanded ? <ExpandPanel item={it} /> : null}
          </div>
        );
      })}
    </div>
  );
}

export default function DiscoveryCards() {
  const kind = (props && props.kind) || "albums";
  const items = (props && props.items) || [];
  const table = props && props.table;
  const [view, setView] = useState("cards");

  if (items.length === 0) {
    return <div style={{ padding: "12px", opacity: 0.7 }}>Nothing to show.</div>;
  }

  return (
    <div style={{ width: "100%", padding: "8px 0" }}>
      <style>{`@keyframes dc-marquee { 0%, 12% { transform: translateX(0); } 88%, 100% { transform: translateX(var(--marquee-shift)); } }`}</style>

      <div style={{ display: "flex", justifyContent: "flex-end", marginBottom: "8px" }}>
        <button
          onClick={() => setView((v) => (v === "cards" ? "table" : "cards"))}
          style={{ fontSize: "12px", padding: "4px 12px", borderRadius: "6px", border: "1px solid rgba(127,127,127,0.3)", background: "transparent", color: "inherit", cursor: "pointer", opacity: 0.85 }}
        >
          {view === "cards" ? "Show as table" : "Show as cards"}
        </button>
      </div>

      {view === "table" ? <DataTable table={table} /> : <CardGrid kind={kind} items={items} />}
    </div>
  );
}