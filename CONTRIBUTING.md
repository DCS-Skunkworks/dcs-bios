# Contributing to DCS-BIOS

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following is a set of guidelines for contributing to DCS-BIOS and related tools, which are hosted in the [DCS-Skunkworks Organization](https://github.com/DCS-Skunkworks) on GitHub. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

#### Table Of Contents

[Code of Conduct](#code-of-conduct)

[I don't want to read this whole thing, I just have a question!!!](#i-dont-want-to-read-this-whole-thing-i-just-have-a-question)

[How Can I Contribute?](#how-can-i-contribute)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)
- [Your First Code Contribution](#your-first-code-contribution)
- [Pull Requests](#pull-requests)

[Styleguides](#styleguides)
- [Git Commit Messages](#git-commit-messages)
- [Lua Styleguide](#lua-styleguide)

## Code of Conduct

This project and everyone participating in it is governed by the [DCS-BIOS Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior via [Discord](https://discord.gg/5svGwKX).

## I don't want to read this whole thing I just have a question!!!

> [!Important]
> _Please don't file an issue to ask a question._ You'll get faster results by using the resources below.

We have an official message board with a detailed FAQ and where the community chimes in with helpful advice if you have questions.

* [GitHub Discussions, the official DCS-BIOS message board](https://github.com/DCS-Skunkworks/dcs-bios/discussions)

## How Can I Contribute?

### Reporting Bugs

This section guides you through submitting a bug report for DCS-BIOS. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior :computer: :computer:, and find related reports :mag_right:.

Before creating bug reports, please check [this list](#before-submitting-a-bug-report) as you might find out that you don't need to create one. When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report). Fill out the required template, the information it asks for helps us resolve issues faster.

> [!Note]
> If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

#### Before Submitting A Bug Report

- **Check if you can reproduce the problem [in the latest version of DCS-BIOS](https://github.com/DCS-Skunkworks/dcs-bios/blob/main/README.md#installation)**.
- **Check the [discussions](https://github.com/DCS-Skunkworks/dcs-bios/discussions)** for a list of common questions and problems.
- **Perform a [cursory search](https://github.com/search?q=+is%3Aissue+user%3ADCS-Skunkworks)** to see if the problem has already been reported. If it has **and the issue is still open**, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Bug Report?

Bugs are tracked as [GitHub issues](https://guides.github.com/features/issues/). When creating an issue, be sure to fill out all information requested in the issue template.

Explain the problem and include additional details to help maintainers reproduce the problem:

- **Use a clear and descriptive title** for the issue to identify the problem.
- **Include the aircraft name** in the title, if applicable.
- **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining which mission you're running. When listing steps, **don't just say what you did, but explain how you did it**. For example, if you started up the aircraft, explain if you used a hot start mission, the autostart shortcut, or started the aircraft manually - and if so, how?
- **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
- **Explain which behavior you expected to see instead and why.**
- **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem. You can use [this tool](https://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux.
- **If you're reporting that DCS-BIOS crashed**, include your `dcs.log` and `DCS-BIOS.log` files. On Windows, these files will be located in `%USERPROFILE%\Saved Games\DCS.openbeta\Logs` or `%USERPROFILE%\Saved Games\DCS.openbeta\Logs`.
- **If the problem wasn't triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below.

Provide more context by answering these questions:

- **Did the problem start happening recently** (e.g. after updating to a new version of DCS-BIOS) or was this always a problem?
- If the problem started happening recently, **can you reproduce the problem in an older version of DCS-BIOS?** What's the most recent version in which the problem doesn't happen? You can download older versions of DCS-BIOS from [the releases page](https://github.com/DCS-Skunkworks/dcs-bios/releases).
- **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.

Include details about your configuration and environment:

- **Which version of DCS-BIOS are you using?** You can get the exact version via a reference tool under `CommonData > Metadata`.
- **What version of DCS are you running**?
- **Which other exports do you have installed?** Please include your `Export.lua` file.
- **Have you customized BIOSConfig.lua**? If so, provide the contents of that file, preferably in a [code block](https://help.github.com/articles/markdown-basics/#multiple-lines) or with a link to a [gist](https://gist.github.com/).

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for DCS-BIOS, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:.

Before creating enhancement suggestions, please check [this list](#before-submitting-an-enhancement-suggestion) as you might find out that you don't need to create one. When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-suggestion). Fill in [the template](https://github.com/DCS-Skunkworks/dcs-bios/blob/main/.github/ISSUE_TEMPLATE/feature_request.md), including the steps that you imagine you would take if the feature you're requesting existed.

#### Before Submitting An Enhancement Suggestion

- **Check if you're using the latest version of DCS-BIOS** and if you can get the desired behavior by changing the configuration.
- **Perform a [cursory search](https://github.com/search?q=+is%3Aissue+user%3ADCS-Skunkworks)** to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://guides.github.com/features/issues/). Create an issue and provide the following information:

- **Use a clear and descriptive title** for the issue to identify the suggestion.
- **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
- **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
- **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
- **Include screenshots and animated GIFs** which help you demonstrate the steps or point out the part of DCS-BIOS which the suggestion is related to. You can use [this tool](https://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux.
- **Explain why this enhancement would be useful** to most DCS-BIOS users and isn't something that can or should be implemented by a consumer or panel developer.
- **Specify which version of DCS-BIOS you're using.** You can get the exact version via a reference tool under `CommonData > Metadata`.
- **Specify the name and version of DCS you're using.**

### Your First Code Contribution

Unsure where to begin contributing to DCS-BIOS? You can start by looking through these `beginner` and `help-wanted` issues:

- [Beginner issues][beginner] - issues which should only require a few lines of code, and a test or two.
- [Help wanted issues][help-wanted] - issues which should be a bit more involved than `beginner` issues.

Both issue lists are sorted by total number of comments. While not perfect, number of comments is a reasonable proxy for impact a given change will have.

### Pull Requests

The process described here has several goals:

- Maintain DCS-BIOS's quality
- Fix problems that are important to users
- Engage the community in working toward the best possible DCS-BIOS
- Enable a sustainable system for DCS-BIOS's maintainers to review contributions

After you submit your pull request, verify that all [status checks](https://help.github.com/articles/about-status-checks/) are passing <details><summary>What if the status checks are failing?</summary>If a status check is failing, and you believe that the failure is unrelated to your change, please leave a comment on the pull request explaining why you believe the failure is unrelated. A maintainer will re-run the status check for you. If we conclude that the failure was a false positive, then we will open an issue to track that problem with our status check suite.</details>

While the prerequisites above must be satisfied prior to having your pull request reviewed, the reviewer(s) may ask you to complete additional design work, tests, or other changes before your pull request can be ultimately accepted.

## Styleguides

### Git Commit Messages

- Prefix your commit with the aircraft name ("F-4E: Add thing")
- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line

### Lua Styleguide

All Lua code is linted with [StyLua](https://github.com/JohnnyMorganz/StyLua) and [luacheck](https://github.com/lunarmodules/luacheck).

## Acknowledgements

This CONTRIBUTING.md has been adapted from [Atom](https://github.com/atom/atom/blob/master/CONTRIBUTING.md).

[beginner]: https://github.com/search?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22+user%3ADCS-Skunkworks+sort%3Acomments-desc&type=issues
[help-wanted]: https://github.com/search?q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22+user%3ADCS-Skunkworks+sort%3Acomments-desc&type=issues
