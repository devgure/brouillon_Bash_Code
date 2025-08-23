


echo "Creating sparkr-app directory..."
mkdir -p sparkr-app

# Create all directories
find . -type d -name "*" | while read dir; do
  mkdir -p "sparkr-app/$dir"
done

# Now generate files (example for key ones)
cat > sparkr-app/apps/admin/components/RetoolEmbed.tsx << 'EOF'
import React from 'react';
export default function RetoolEmbed() {
  return (
    <div style={{ width: '100%', height: '100vh' }}>
      <iframe
        src="https://your-retool-app.retool.com/embedded/public/abcd1234"
        width="100%"
        height="100%"
        frameBorder="0"
      />
    </div>
  );
}
EOF

cat > sparkr-app/tests/e2e/chat.cy.ts << 'EOF'
describe('Sparkr E2E: Swipe → Match → Chat', () => {
  it('should swipe right, get match, and send message', () => {
    cy.login('user1@test.com', 'password123');
    cy.get('[data-cy=card]').trigger('mousemove', { clientX: 300 }).trigger('mouseup', { force: true });
    cy.contains('It\'s a match!').should('be.visible');
    cy.get('[data-cy=input]').type('Hey! 👋').type('{enter}');
    cy.get('[data-cy=message]').contains('Hey! 👋');
  });
});
EOF

cat > sparkr-app/README.md << 'EOF'
# Sparkr - Production-Ready Dating App
...
EOF

echo "Project generated in ./sparkr-app"
echo "Run 'cd sparkr-app && pnpm install' to start"
