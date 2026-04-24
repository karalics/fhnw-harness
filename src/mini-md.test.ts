import { test, expect } from 'vitest';
import { miniMd } from './mini-md';

test('converts **bold** to <strong>', () => {
  expect(miniMd('hello **world**')).toBe('hello <strong>world</strong>');
});

test('converts *italic* to <em>', () => {
  expect(miniMd('hello *world*')).toBe('hello <em>world</em>');
});

test('handles bold and italic together', () => {
  expect(miniMd('**bold** and *italic*')).toBe('<strong>bold</strong> and <em>italic</em>');
});

test('converts # heading to <h1>', () => {
  expect(miniMd('# Hello')).toBe('<h1>Hello</h1>');
});

test('converts ## heading to <h2>', () => {
  expect(miniMd('## Subheading')).toBe('<h2>Subheading</h2>');
});

test('full example with heading, bold, and italic', () => {
  expect(miniMd('# **Welcome** to *mini-md*')).toBe('<h1><strong>Welcome</strong> to <em>mini-md</em></h1>');
});
