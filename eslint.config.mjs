import { defineConfig, globalIgnores } from "eslint/config";
import nextVitals from "eslint-config-next/core-web-vitals";
import nextTs from "eslint-config-next/typescript";

const eslintConfig = defineConfig([
  ...nextVitals,
  ...nextTs,
  // Override default ignores of eslint-config-next.
  globalIgnores([
    // Default ignores of eslint-config-next:
    ".next/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
    // Prisma (not part of the Next.js runtime bundle)
    "prisma/**",
    "prisma.config.ts",
    // The original 2016-17 Java/JSP project, kept for reference. Includes
    // vendored Bootstrap and AngularJS bundles that this config can't lint.
    "legacy/**",
  ]),
]);

export default eslintConfig;
