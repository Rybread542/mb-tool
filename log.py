import logging
import sys
from datetime import datetime
from pathlib import Path

LOG_DIR = Path("logs")

_initialized = False
_chat_logger = None

_divider = '---------------------------------------------------------------------------------'


def _log():
    return _chat_logger or init_logging()

def log_divider():
    _log().info(_divider)

def session_header():
    log_divider()
    _log().info('-------------------------------SESSION START-------------------------------------')
    log_divider()

def log_query(q):
    log_divider()
    _log().info(f'-------------[QUERY]: {q}')
    log_divider()



class TranscriptFormatter(logging.Formatter):
    """Plain '[timestamp] message' for chat transcript lines, and a more
    detailed '[timestamp] LEVEL logger: message' for everything else."""

    def format(self, record):
        is_transcript = record.name == "chat" and record.levelno == logging.INFO
        if is_transcript:
            stamp = self.formatTime(record, self.datefmt)
            return f"[{stamp}] {record.getMessage()}"
        return super().format(record)


def init_logging(echo_to_console=True, third_party_level=logging.WARNING):
    
    global _initialized, _chat_logger
    if _initialized:
        return _chat_logger

    LOG_DIR.mkdir(exist_ok=True)
    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    log_path = LOG_DIR / f"chatlog_{stamp}.log"

    formatter = TranscriptFormatter(
        fmt="[%(asctime)s] %(levelname)s %(name)s: %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )

    file_handler = logging.FileHandler(log_path, encoding="utf-8")
    file_handler.setFormatter(formatter)

    root = logging.getLogger()
    root.setLevel(third_party_level)   # keep chatter down
    root.addHandler(file_handler)

    if echo_to_console:
        console = logging.StreamHandler(sys.stdout)
        console.setFormatter(formatter)
        root.addHandler(console)

    _chat_logger = logging.getLogger("chat")
    _chat_logger.setLevel(logging.INFO)

    def log_uncaught(exc_type, exc_value, traceback_obj):
        if issubclass(exc_type, KeyboardInterrupt):
            sys.__excepthook__(exc_type, exc_value, traceback_obj)
            return
        _chat_logger.error(
            "Uncaught exception", exc_info=(exc_type, exc_value, traceback_obj)
        )

    sys.excepthook = log_uncaught

    _initialized = True
    _chat_logger.info(f"--- log started: {log_path} ---")
    return _chat_logger

def format_table(df, max_rows):
    if df is None or len(df) == 0:
        return "    (no rows)"
    body = df.head(max_rows).to_string(index=False)
    indented = "\n".join("    " + line for line in body.splitlines())
    if len(df) > max_rows:
        indented += f"\n    ... ({len(df)} rows total)"
    return indented

