# Virtual Company — a company run by AI employees

A startup you can watch working. Thirty-two AI employees (a CEO, ten department heads, their
teams and a founder's assistant) hold meetings, write mail, do research, prepare documents and
ask you, the founder, for approval. You open the dashboard, press **Go live**, and the company
starts its day.

![The company campus in 3D](docs/campus.jpg)

## What you can do

- **Campus** – the whole company in 3D: a headquarters, one building per department and the
  meeting rooms. Lights come on where people work; a beam shows who is talking to whom.
- **Interrupt any meeting** – type into a running meeting and the people stop and answer you.
- **Chat with any employee**, by text or by voice.
- **Founder Desk** – every decision that needs the owner waits here for Approve or Reject.
- **Agent Management** – add, change or remove employees, write their system prompt and choose
  their AI model.
- **Office floor, Control Room, Screens, Mail, Meetings, Documents, Deliverables** – every view of
  the same live company.

The employees only *prepare*: they cannot spend money, create accounts, post or contact anyone.
Whatever must be done outside the company is handed to you as a deliverable.

## Requirements

- **Python 3.10 or newer** (no extra packages needed). Built and tested on Windows; macOS and Linux are untested.
- **Claude Code**, signed in with your own Claude account. The server runs the employees through
  `claude -p`, so the work uses your own Claude plan.
  - Optional: a Claude API key (set in *Agent Management*) or a local Ollama model per employee.
- A Chromium browser (Chrome or Edge) for the 3D campus and the voice features.

## Start

```bash
git clone <this repository>
cd <the folder>
python server.py
```

The dashboard opens at <http://127.0.0.1:8765>. On Windows you can double-click
`Start Company Dashboard.bat` instead. If the dashboard says the real engine is not logged in,
run `claude auth login` (Windows: `Login Company Brain.bat`) and press **Check again**.

On the first start the company is created from `seed/state.json`. Everything it does afterwards
is saved in `data/`, `documents/` and `social/` on your own computer. Those folders are not part
of this repository.

## How it works

- `server.py` – one Python file: a small web server, the live-work loop and the prompts.
- `static/index.html` – the whole dashboard: one HTML file, no build step, no libraries.
- `seed/state.json` – the starter company: people, jobs, departments.
- `CLAUDE.md` – the playbook: files, rules and how the pieces fit together.

The company works only while the dashboard is live. One step of work (a meeting, a mail, a piece
of research) is one model call that writes what the people say and do; meetings are written in
parts, so you can speak in between.

To try changes without touching your company, run a second copy on other files:

```bash
python server.py --no-browser --port=8766 --home=/path/to/a/copy
```

## Good to know

- The server listens on `127.0.0.1` only. It has no login, so do not put it on the internet as it is.
- Live work uses your Claude plan. The pace (every 1, 2 or 5 minutes) and a daily limit of 100
  activities are in the dashboard and in `server.py`.
- The employees and their names are invented. Nothing they say about markets, customers or money
  is a verified fact.

## Licence

All rights reserved. You are welcome to read the code and see how it works. Copying, reusing or
redistributing it is not permitted for now.
