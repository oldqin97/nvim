/**
 * 将输入参数的值打印到控制台并返回它。
 *
 * @param {*} q - 要打印和返回的输入参数。
 * @returns {*} 传入的相同输入参数。
 */
function ttt(q) {
  console.log(q);
  return q;
}

console.log(123);

/**
 * 计算斐波那契数列的第n项。
 *
 * @param {number} n - 要计算的斐波那契数列的项数（非负整数）。
 * @returns {number} 斐波那契数列的第n项的值。
 */
function fibonacci(n) {
  if (n <= 1) return n;
  let a = 0;
  let b = 1;
  for (let i = 2; i <= n; i++) {
    [a, b] = [b, a + b];
  }
  return b;
}

// 测试用例
console.log(fibonacci(10)); // 55
console.log(fibonacci(11)); // 89
console.log(fibonacci(50)); // 12586269025
// ◍ angular-language-server angularls (keywords: angular)
// ◍ astro-language-server astro (keywords: astro)
// ◍ bash-debug-adapter (keywords: bash)
// ◍ black (keywords: python)
// ◍ codelldb (keywords: c, c++, rust, zig)
// ◍ css-lsp cssls (keywords: css, scss, less)
// ◍ css-variables-language-server css_variables (keywords: css, scss, less)
// ◍ cssmodules-language-server cssmodules_ls (keywords: css)
// ◍ dart-debug-adapter (keywords: dart)
// ◍ debugpy (keywords: python)
// ◍ docker-compose-language-service docker_compose_language_service (keywords: docker)
// ◍ dockerfile-language-server dockerls (keywords: docker)
// ◍ emmet-language-server emmet_language_server (keywords: emmet)
// ◍ eslint-lsp eslint (keywords: javascript, typescript)
// ◍ graphql-language-service-cli graphql (keywords: graphql)
// ◍ hadolint (keywords: docker)
// ◍ html-lsp html (keywords: html)
// ◍ js-debug-adapter (keywords: javascript, typescript)
// ◍ json-lsp jsonls (keywords: json)
// ◍ ltex-ls ltex (keywords: text, markdown, latex, restructuredtext)
// ◍ lua-language-server lua_ls (keywords: lua)
// ◍ nginx-language-server nginx_language_server (keywords: nginx)
// ◍ node-debug2-adapter (keywords: javascript, typescript)
// ◍ prettier (keywords: angular, css, flow, graphql, html, json, jsx, javascript, less, markdown, scss, typescript, vue, yaml)
// ◍ pyright (keywords: python)
// ◍ quick-lint-js quick_lint_js (keywords: javascript, typescript)
// ◍ ruff (keywords: python)
// ◍ shfmt (keywords: bash, mksh, shell)
// ◍ sql-formatter (keywords: sql)
// ◍ sqlfluff (keywords: sql)
// ◍ sqlls (keywords: sql)
// ◍ stylua (keywords: lua, luau)
// ◍ svelte-language-server svelte (keywords: svelte)
// ◍ taplo (keywords: toml)
// ◍ vtsls (keywords: javascript, typescript)
// ◍ vue-language-server volar (keywords: vue)
// ◍ yaml-language-server yamlls (keywords: yaml)
