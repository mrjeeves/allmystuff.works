# Homepage spec — allmystuff.works

Working document. Prune and add freely. Goal is to enable a clean rebuild of `index.html` without redoing the conversation that produced this.

---

## 1. The page's job

Take a curious-but-uncommitted reader from "what is this" to "send me the app" — in one scroll, on a phone, in under three minutes. The conversion is an email capture, not a purchase.

Secondary jobs: make the product feel inevitable (not novel-for-novelty's-sake), make pricing legible without sales-page energy, and answer the obvious objections without being defensive.

---

## 2. The product, in plain terms

allmystuff.works makes the gear you already own cooperate without making you the IT person. It runs as an app on the computers you have, hosts a local AI for you, handles every network seam between your devices, and gives you a Summon button to a real technician when you'd rather not figure something out yourself.

It's a Critical Error Computing (CEC) product. CEC also sells the optional hardware that extends it.

### Architecture (two-part)

- **Brain** — anything that runs the app and holds your AI. Most people start with a laptop or desktop they already own. Stacking brains lets the system do more at once.
- **Limbs** — small boxes that extend the brain's reach into rooms, voices, sensors, and machines that don't run our software.

### The three things that ride on every brain

- The connection software (handles all the seams)
- Your local AI (lives on the brain — we can't see what it sees)
- A Summon button to a real technician (only when you press it)

### Brain options (selected by the customer)

| Name | What it is | Price |
| --- | --- | --- |
| Your computer | Any laptop/desktop with the app | $0 |
| Roam | Battery-powered touchscreen brain — for your bag | $499 |
| Counter | AC-only touchscreen brain — more horsepower than Roam | $499 |
| Probe | Entry CEC naval-class workhorse | from $1,249 |
| Den+ (any computer with a dedicated GPU) | Your gaming PC, or any CEC machine above the Probe (Fighter, Corvette, Frigate, Destroyer) | your existing GPU, or from $1,699 |

### Limbs (à la carte)

| Name | What it does | Price |
| --- | --- | --- |
| Bell | Wall touchscreen + mic + speakers + Summon button | from $149 |
| Lapel | Clip-on voice recorder, beam-forming mic. **No camera.** | from $79 |
| Pulse | Small sensors (power, temp, humidity, leak, USB sniff) | from $39 |
| Latch Mobile | Portable USB+HDMI bridge into any computer | $99 |
| Latch Pro | Internal PCIe version of Latch — ships in every CEC machine | $99 |

### Pricing

- **Software**: free forever, every feature on, including a 1 Mbps TURN relay
- **Relay bumps**: $10/mo (10 Mbps), $20/mo (100 Mbps), $30/mo (200 Mbps). Throughput throttled, never capped monthly.
- **Support**: $25/session (15 min included, $1/min after), or $19/mo (priority + 30 min), or $69/mo (front of queue + 90 min). Anyone on shift answers; the AI hands them the context.

### Privacy stance

- The local AI runs on the customer's brain. We can't read what it sees.
- When Summon is pressed, our AI gets only the one-sentence summary needed to route.
- The technician sees only what's approved, only while the session is live.
- We see that a session happened (for billing). We don't record what was on screen.

---

## 3. The reader

Not a homelab person. Not someone shopping for a router. Not someone with a Home Assistant install they're happy with — they already have a solution and they're not the audience.

The reader:

- Has more gear than the average house (laptop, phone, printer, cameras, NAS, smart-home things, gaming PC).
- Has noticed the gear doesn't cooperate.
- Has looked at the various ways to fix that (Home Assistant, Tailscale, Plex, Synology, etc.) and decided it wasn't worth the weekend, plus the next weekend, plus the maintenance forever.
- Lives with the friction.

They are not lazy. They did the cost-benefit math right. The page opens because we changed the cost side of that equation.

---

## 4. Voice

Plain, sympathetic, specific. Not clever, not contrarian, not defensive.

### What the voice IS

- **Specific moments over feature lists.** "Print to the house from a hotel in Denver" beats "print from anywhere." "Dad and the lake, before grandma got the dog" beats "find any photo by asking."
- **Em-dashes, parentheticals, asides** — magazine-column rhythm.
- **Italic for emphasis** in H1 and H2 (signature visual move, keep). Set off the punch.
- **Short sentences against long ones** for rhythm. Plain words.
- **Confident about what we do; sympathetic about what the reader has been dealing with.**

### What the voice is NOT (lessons from prior iterations)

Each of these has been tried; each failed for a reason worth remembering.

- **Don't argue with the reader.** "We disagree." "Most people are wrong." If the reader sees themselves in a sentence and then the next sentence tells them they were wrong, the page is picking a fight. Sit next to them instead.
- **Don't be clever.** "We did the bother — once, in software — so the thing comes out ahead." Reads as pretentious. "We built the version where you don't have to do the work" says the same thing in plain English.
- **Don't commoditize humans.** "Minutes of a person." "Human minutes." Sounds like we ship people by the kilo. We sell *support*, not the humans providing it. "A person answers" is fine because it describes the experience; "minutes of a person" is a price tag on a body.
- **Don't overclaim.** "Four things that don't work today" is false — these things CAN work, with effort. The opening is fragility ("it's a weekend to set up, and another every few months to keep it working"), not impossibility.
- **Don't lecture before showing.** Architecture before outcomes loses the reader. The brain+limbs idea is satisfying as a *reveal* after you've seen what it enables. As an opening, it's a lecture.
- **Don't patronize.** "Pick anything below." "After you've seen a few, the trick will be obvious." These read like the page is directing traffic. Trust the reader to find the floor.
- **Don't hedge defensively.** "Without you having to wire anything up, learn what an IP address is, or open a router admin page." Defining the product by what it isn't is weaker than naming what it is.
- **Don't repeat the brand line in the hero subtitle.** "Tech that works when you turn it on. Not tech you work to keep on." Fine as a footer line; it doesn't earn its place as the lede.

### A sentence that works

> Four nice things almost no one has. *Here, you do.*
>
> Each is possible today — with a weekend to set up, and another every few months to keep it working when something moves or reboots or updates. Most people look at the math, pass, and live without. Reasonable call. We built the version where you don't have to do the work.

That's the tone target. Acknowledges the reader's reality, doesn't argue, lands the offer without flourishes.

---

## 5. Story arc

The page is a story, not a checklist. Each section should pivot — set up tension or curiosity, resolve it, hand off to the next.

1. **Hero** — clear, plain promise. The reader knows what this is in 10 seconds.
2. **Recognition** — the reader sees their own life. Specific moments with stakes. This is the "show, don't tell" beat; the architecture is implicit but unnamed.
3. **Reveal** — *now* the architecture earns its introduction. One brain thinking, limbs reaching, plus the three things on every brain.
4. **Catalog** — what they'd buy, if anything. Lead with "most people start with a laptop they already own."
5. **Money** — what costs what, plainly. Free is the headline, not a third column.
6. **Friction** — FAQ for the questions they're about to ask anyway.
7. **Conversion** — email capture.

A section that reads as a standalone module is a sign the page hasn't earned its connective tissue. Each section should reference the one before it (subtly) so the reader feels carried, not handed off.

---

## 6. Anchor propositions

The page needs to convey this territory somewhere. These aren't sentences — they're the things the reader should leave knowing.

- The gear you already own can do more than you think. We make it cooperate.
- One computer in the house runs an AI that's yours, and handles every connection. Other small boxes extend its reach.
- Setting this up yourself is doable; keeping it set up forever isn't worth most people's time. So most people don't have any of it. We changed that.
- The software is free, every feature on. We make money on hardware and on technician time — only if you want either.
- Your AI never reports to us. The human-on-shift gets only what you approve, only when you press Summon.
- Nothing locks you in. Boxes keep working if you cancel; data has always lived on your devices.

---

## 7. What NOT to put on the page

- The Tailscale comparison in marketing copy. The reader hasn't heard of Tailscale. Keep in FAQ if at all.
- The naval-class lineup names (Fighter / Corvette / Frigate / Destroyer) in the main flow. "More CEC machines" with a link to criticalerrorcomputing.com is enough. The names are interesting but a side quest.
- TURN / STUN / WebRTC terms. "Relay" is the consumer word.
- Three-column "pillars" with abstract labels. We've tried this every which way. It always reads flat.
- A pay section that visually treats the free tier as one option among three. The free tier IS the product; paid tiers are footnotes.
- "Coming soon" or "early access" framing. The product is for people who want to use it now.

---

## 8. Visual and technical constraints

- Static HTML/CSS/JS. No build step. No frameworks. Edit and push.
- GitHub Pages hosting. Single-page document with anchor-linked sections.
- Palette: warm tans, sage teal, cream backgrounds. Existing CSS variables in `styles.css` are a good starting point; the CSS itself is currently overgrown and could be halved with a fresh pass.
- Type: serif headings (Fraunces or system serif), sans body. Real italics on the H1/H2 emphasis fragment.
- Mobile-first. Everything stacks cleanly at 390px. Test there first.
- Dark mode softens, doesn't invert. (The brand is warm and light.)
- Accessibility: skip-link, semantic markup, proper landmark roles, `prefers-reduced-motion` respected, focus styles visible.
- Animations are quiet — slow dashed-line flows, soft pulses. Nothing bouncy.

---

## 9. Open questions

These are the calls the next iteration gets to make.

- **Hero visual.** The constellation (five device icons orbiting a central brain) is pretty. Whether it communicates the value, vs. being decorative, is debatable. Could be replaced with something more specific (a single annotated moment? A simple text-only hero?).
- **The "bridge" moment.** A single dramatic italic sentence in a warm panel between scenes and architecture. It works but might be a tic — would it survive a fresh pass?
- **"Nice things" framing.** Reads well in the current draft; whether it's the right *opening* metaphor or just a useful sympathy beat is open.
- **Pay section shape.** Three equal cards is the current layout. Could be one main "free" hero with two sidebars for relay and support — more honest about what's actually the product.
- **FAQ length.** Eight questions is a lot. Could be six. Could be linked-to instead of inline.
- **How much CEC presence.** Currently the page mentions CEC in the eyebrow, the brains section, and the footer. Could be more (this is a CEC product, after all) or could be less (let the brand stand on its own).

---

## 10. The current page (`index.html`) as a reference

The current page has the right product facts and many of the right paragraphs, but the structure is over-engineered and the voice has whiplashed through several iterations. **Don't refactor it.** Use it as a source of:

- Correct product information (names, prices, capabilities)
- Specific sentences that work (e.g., the photos scene, the gaming scene, several FAQ answers)
- Visual assets (the constellation SVG, the brain+limbs diagram, the gaming SVG)

Then write `index.html` from scratch against this spec.
