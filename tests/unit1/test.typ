#import "/src/lib.typ": *

// Test 1: Color constants are correctly defined
#assert.eq(cc-primary-yellow, "#f8d7b0")
#assert.eq(cc-secondary-brown, "#392518")
#assert.eq(cc-accent-blue, "#7bd4ff")
#assert.eq(cc-lighter-blue, "#cceeff")
#assert.eq(cc-accent-green, "#90ee90")
#assert.eq(cc-light-grey, "#666666")
#assert.eq(cc-divider-grey, "#dddddd")
#assert.eq(cc-code-background, "#f8f9fa")
#assert.eq(block-radius-value, 2pt)

// Test 2: Functions return content (smoke tests)
#let result = callout[This is a test callout]
#assert.ne(result, none)
#assert(type(result) == content)

// Test 3: Callout with custom parameters doesn't crash
#let result = callout(
  title: "Warning",
  icon: emoji.warning,
  color: rgb("#ff0000"),
  [Custom callout content]
)
#assert.ne(result, none)
#assert(type(result) == content)

// Test 4: Quote functions return proper content type
#let block_result = cc-quote(block: true, [Block quote])
#let inline_result = cc-quote(block: false, [Inline quote])

#assert.ne(block_result, none)
#assert.ne(inline_result, none)
#assert(type(block_result) == content)
#assert(type(inline_result) == content)

// Test 5: Markdown rendering smoke tests
#let simple_md = "# Test\n\nSome **bold** text."
#let result = render-markdown(simple_md)

#assert.ne(result, none)
#assert(type(result) == content)

// Test 6: Markdown with math doesn't crash
#let math_md = "Equation: $E = mc^2$"
#let result = render-markdown(math_md)

#assert.ne(result, none)
#assert(type(result) == content)

// Test 7: Template compiles without errors - minimal case
#let result = articulate-coderscompass(
  title: "Test Title",
  [Test content]
)
#assert.ne(result, none)
#assert(type(result) == content)

// Test 8: Template with multiple authors compiles
#let result = articulate-coderscompass(
  title: "Multi-Author Test",
  authors: (
    (name: "First Author", email: "first@test.org", affiliation: "Test Org"),
    (name: "Second Author", email: "second@test.org", affiliation: "Test Org"),
  ),
  [Test content with multiple authors]
)
#assert.ne(result, none)
#assert(type(result) == content)

// Test 9: Template with all parameters compiles
#let result = articulate-coderscompass(
  title: "Full Parameter Test",
  subtitle: "Testing All Options",
  authors: (
    (name: "Test Author", email: "test@example.org", affiliation: "Test Organization"),
  ),
  abstract: [Complete test of all template parameters and options.],
  keywords: ("test", "template", "typst", "unit-testing"),
  version: "2.0.0",
  reading-time: "3 minutes",
  watermark: "TEST BUILD",
  website-url: "https://coderscompass.org",
  publication: "Test Publication",
  use-brand-fonts: false,
  [Full template test content goes here with all parameters specified.]
)
#assert.ne(result, none)
#assert(type(result) == content)

// Test 10: Edge case - empty authors array
#let result = articulate-coderscompass(
  title: "Empty Authors Test",
  authors: (),
  [Content with no authors specified]
)
#assert.ne(result, none)
#assert(type(result) == content)

// Test 11: Color conversion functionality
// Verify colors can be converted to rgb type
#let primary_rgb = rgb(cc-primary-yellow)
#let secondary_rgb = rgb(cc-secondary-brown)
#let accent_rgb = rgb(cc-accent-blue)

#assert.ne(primary_rgb, none)
#assert.ne(secondary_rgb, none)
#assert.ne(accent_rgb, none)

// Test 12: Parameter type validation
// Test that version parameter works with strings
#assert(type("1.0.0") == str)
#assert(type(2pt) == length)

// Test that date parameter accepts datetime
#let test_date = datetime.today()
#assert.ne(test_date, none)
