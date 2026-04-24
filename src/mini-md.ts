export const miniMd = (input: string): string =>
  input
    .replace(/^(#{1,6})\s+(.+)$/gm, (_, hashes: string, text: string) =>
      `<h${hashes.length}>${text}</h${hashes.length}>`)
    .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
    .replace(/\*(.+?)\*/g, '<em>$1</em>');
