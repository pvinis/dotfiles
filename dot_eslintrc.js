const OFF = 0
const WARN = 1
const ERR = 2
module.exports = {
    env: {
        es6: true,
        node: true,
    },
    extends: [
        'eslint:recommended',
        'plugin:react/recommended',
    ],
    globals: {
        Atomics: 'readonly',
        SharedArrayBuffer: 'readonly',
    },
    // parser: 'babel-eslint',
    parserOptions: {
        ecmaFeatures: {
            jsx: true,
        },
        ecmaVersion: 2018,
        sourceType: 'module',
    },
    plugins: ['react'],
    rules: {
        'no-unused-vars': OFF,
        semi: [ERR, 'never'],
        quotes: [ERR, 'single'],
        'comma-dangle': [ERR, 'always-multiline'],
        'object-curly-spacing': [ERR, 'always'],
        'key-spacing': ERR,
        indent: [ERR, 'tab'],
        'no-console': OFF,
        'arrow-spacing': ERR,
        'no-multi-spaces': [ERR, { 'ignoreEOLComments': true }], // has exceptions too, if needed

        'react/jsx-indent': [ERR, 'tab'],
        'react/prop-types': OFF,
        'react/jsx-space-before-closing': ERR,
        'react/display-name': OFF,
    },
}
