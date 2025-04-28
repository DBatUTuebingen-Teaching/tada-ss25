# Exercises with `git`

This semester we will use the version control system `git` in the lecture for:
- Share all materials (Slides, SQL files, _etc._) with you,
- Providing exercise sheets,
- Submitting (uploading) your solutions, and
- Distributing correction notes.

General information about `git` can be found on the web at http://git-scm.com. You will find all the necessary details here to be able to use `git` for the exercise operation. Please read the instructions carefully—even details are important. After a short acclimatization phase, the necessary commands will come to you automatically.

## Setup

The following steps are to be performed **only once** during the entire semester.

1. **Install `git`.** You can find installation instructions for all common operating systems at http://git-scm.com/downloads. Alternatively, `git` is also available in the package manager of your operating system. We recommend that you work with `git` on the command line, just like we do. We can provide you with hints and assistance for the command line variant. If you use graphical variants, that's fine—you're on your own then.

2. **Create an account on `github` (http://github.com).** If you already have an account there, you can also use it for the exercise operation.

  We use the `Classroom` service on `github` to store our exercise sheets and your solutions in so-called repositories (short: repos). These repos are **not** publicly accessible.

3. **Register on Discord.** We will use Discord (https://db.cs.uni-tuebingen.de/discord) for communication and discussion of lecture content, as well as for the organization of the exercises. Therefore, registration on Discord is **not** optional.

4. Checkout the `#announcements` channel on Discord. There you will find the link to the registeration for the exercises. Join an existing team or create a new one.

5. Once you have joined or created a team, there will be a repository created for your team on `github` (in the `DBatUTuebingen-Teaching` organization). This repository is private and only accessible to the members of your team:
  https://github.com/DBatUTuebingen-Teaching/⟨lecture⟩-⟨YourTeam⟩

6. **Clone the repository.**
  ```bash
  git clone git@github.com:DBatUTuebingen-Teaching/⟨lecture⟩-⟨YourTeam⟩.git
  ```
  This will create a local copy of the repository on your computer. You can now start working on the exercises.

7. To be able to receive assignments, you will have to add a second git remote:
  ```bash
  git remote add assignments https://github.com/DBatUTuebingen-Teaching/⟨lecture⟩.git
  ```
  This will allow you to pull the assignments from the main repository. You can do this by running:
  ```bash
  git pull assignments main
  ```
  This will fetch the latest assignments from the main repository and merge them into your local copy.

That's it. You are now ready to work on the exercises. You can find the exercise sheets in the `assignments` directory of your local repository.
