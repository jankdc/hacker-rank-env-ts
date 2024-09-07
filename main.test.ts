import assert from "node:assert";
import { spawnSync } from "node:child_process";
import { readdirSync, readFileSync } from "node:fs";
import { dirname } from "node:path";
import test from "node:test";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const tests = readdirSync(`${__dirname}/tests`);

for (const testCase of tests) {
  const directoryPath = `${__dirname}/tests/${testCase}`;
  const description = readFileSync(`${directoryPath}/description.txt`, "utf8");
  const input = readFileSync(`${directoryPath}/input.txt`);
  const output = readFileSync(`${directoryPath}/output.txt`, "utf8");

  test(description, () => {
    const result = spawnSync("npm", ["start", "-s"], {
      input: input,
      encoding: "utf8",
    });

    assert.strictEqual(result.stdout, output);
  });
}
