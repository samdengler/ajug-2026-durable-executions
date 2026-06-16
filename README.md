# Durable Execution: Building Apps That Refuse to Die

**Atlanta Java User Group 2026** | Sam Dengler

Building distributed applications is hard, with challenges like retries, state management, and failure recovery often adding hidden complexity. Durable execution frameworks address these problems by persisting execution and resuming seamlessly after crashes, so developers can focus on business logic instead of plumbing. In this session, you'll see practical code examples and a live demo of how durable execution simplifies microservice orchestration and long-running operations, making resilient apps accessible to every developer.

[View the talk on Atlanta Java User Group](https://luma.com/ajug-twtk?tk=WADDaf) | [View the slides](https://samdengler.github.io/ajug-2026-durable-executions/)

## Slides

The slide deck is built with [Slidev](https://sli.dev/) and hosted on [GitHub Pages](https://samdengler.github.io/ajug-2026-durable-executions/). The source is in the `slides/` directory.

```bash
cd slides
npm install
npx slidev --open false
```

Then open http://localhost:3030/

### Presenting from your phone

Slidev can be driven remotely from a phone on the same network. Start with the
`--remote` flag (add a password to gate access on conference Wi-Fi):

```bash
cd slides
npx slidev --remote yourpassword
```

On your phone, open `http://<laptop-ip>:3030/presenter` to control the deck
(next/prev, notes, timer). Find your IP with `ipconfig getifaddr en0`, or run
`./bin/present.sh` from the repo root to print the presenter URL (and a QR code
if `qrencode` is installed).

## Demo Services

The `services/` directory contains the Restate durable execution demo services used during the live portion of the talk.
