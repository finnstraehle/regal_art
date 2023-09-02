class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :content, presence: true
  validates :conversation, presence: true

  CONTENTS = [
    "Hi, I love your work! Can you tell me more about the painting 'Ethereal Dreams'?",
    "Thank you! 'Ethereal Dreams' is a serene landscape inspired by my love for nature. It captures the play of light on water at dawn.",
    "How much is 'Serenade in Blue'?",
    "'Serenade in Blue' is priced at $2,500. It's a dynamic abstract piece that explores the depths of emotions through vibrant blues and subtle textures.",
    "I'm interested in 'Aurora's Embrace.' Can you share its size and medium?",
    "Certainly! 'Aurora's Embrace' measures 36x48 inches and is an acrylic painting on canvas. It's a captivating portrayal of celestial beauty.",
    "Do you have any landscapes with warm colors?",
    "Absolutely! I have 'Sunset Sonata' and 'Harmony of Colors' which feature warm color palettes and stunning landscapes. Let me know if you'd like more details.",
    "'Abstract Reverie' caught my eye. Can you explain the inspiration behind it?",
    "'Abstract Reverie' is all about exploring emotions and dreams through an abstract lens. The bold colors and intricate patterns are a journey into the mind's complexities.",
    "What's your creative process like?",
    "I begin with inspiration from the world around me. Then, I let my imagination flow onto the canvas. It's a mix of planning and spontaneity, resulting in unique pieces.",
    "I'm on a budget. Do you have smaller, more affordable pieces?",
    "Of course! I have a collection of smaller artworks that are both affordable and beautiful. Let me know your budget, and I can recommend some options.",
    "'Dance of the Fireflies' seems enchanting. Tell me about the technique you used.",
    "'Dance of the Fireflies' is created using an impasto technique, adding texture and depth to the canvas. It's an enchanting scene with a touch of magic.",
    "Your art is breathtaking. How do you come up with such unique compositions?",
    "Thank you for the kind words! I draw inspiration from life, dreams, and even fleeting moments. My goal is to create art that resonates with viewers.",
    "I'm considering 'Crimson Cascade' for my living room. Can you provide more details about its size and framing options?",
    "Certainly! 'Crimson Cascade' is a vibrant piece measuring 30x40 inches. It can be beautifully framed in a sleek black or a rustic wooden frame to suit your decor.",
    "I noticed you also create sculptures. Can you tell me about your sculpture 'Metamorphia'?",
    "Certainly! 'Metamorphia' is a bronze sculpture inspired by transformation and growth. Its intricate details and fluid forms evoke a sense of change and evolution.",
    "I collect art with a focus on abstract expressionism. Do you have any recent pieces in that style?",
    "Yes, I have a series of abstract expressionist works that explore the depths of emotions and spontaneity. I'd be happy to share some recent pieces with you.",
    "I'm drawn to your use of light and shadow. Can you share some insights into your technique for achieving that effect?",
    "Certainly! Achieving the interplay of light and shadow is a meticulous process. I use multiple layers of translucent paint to build depth and create dramatic contrasts.",
    "I'm hosting an art event and would love to feature your work. Are you open to discussing a collaboration?",
    "I'm honored by your invitation! I'd be delighted to discuss a collaboration. Let's connect and explore the possibilities for the event.",
    "Your 'Ethereal Essence' painting speaks to me on a profound level. What emotions do you hope viewers experience when they see it?",
    "'Ethereal Essence' is meant to evoke a sense of wonder and connection to the universe. I hope viewers feel a deep sense of introspection and awe when they encounter it.",
    "I'm a first-time art buyer. Any tips for choosing the right piece for my home?",
    "That's wonderful! When selecting art, choose pieces that resonate with your emotions and aesthetic preferences. Don't be afraid to trust your instincts and select what you love.",
    "I've been following your work for years and finally decided to invest in one of your pieces. Can you tell me more about your signature style?",
    "I appreciate your longtime support! My signature style is characterized by vibrant colors, intricate details, and a commitment to conveying the beauty and complexity of life.",
    "Your 'Mystic Waters' painting reminds me of a dream I once had. Is it connected to any specific dreams or experiences of your own?",
  ]
end
