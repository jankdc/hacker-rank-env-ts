# Hacker Rank Environment (TypeScript)

A TypeScript-specific environment to test and debug a HackerRank problem.

## Getting Started

> This project requires [nvm](https://github.com/nvm-sh/nvm) to get the right node version:

```
git clone https://github.com/jankdc/hacker-rank-env-ts.git your-project-name
cd your-project-name
nvm install
npm install
```

### Development

1. Copy + paste the initial HackerRank code into `main.ts`
2. Add the example input as-is into `input.txt`
3. Run `npm start` or `npm start:watch` for watch mode
4. It will print the output of the program to the terminal

> If you're using VS Code, there's a debugger option. Run the `Debug HackerRank Code` launcher in the debugger panel to start it.

### Testing

Since HackerRank works on standard input and output, we'll have to add our test case's inputs and expected output into files to be read by the test runner later. There's a nifty script wizard to simplify this:

```
# Prompts for description, input and expected output
./scripts/create-test-case.sh

# Or add an empty test case to be filled later
./scripts/create-test-case.sh --empty

# Runs all the test cases
npm test

# Watch mode version
npm run test:watch
```

### Finished?

Simply upload or copy + paste `main.ts` back into HackerRank's editor and submit the code.

🙏 Good luck and have fun! 🙏

## FAQ

### Why make this?

1. HackerRank doesn't support debugging in their interface, which is annoying when you're trying to figure out a bug and you don't want the code to be litterred with logs
2. HackerRank can be slow when you're trying to test your changes and that's not optimal when you don't have a lot of time
3. HackerRank supports only one custom input, which is annoying when you want to add more test cases and making sure changes haven't introduced bugs
4. You prefer your editor/IDE over HackerRank's
