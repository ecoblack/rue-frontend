class Damage::Create < Trailblazer::Operation
  # step Model( Damage, :new )
  # step Policy::Pundit( Application::Policy, :create? )
  # step Contract::Build( constant: Song::Contract::Create )
  # step Contract::Validate()
  # step Contract::Persist()
  # fail Notifier::DBError
  step :update_song_count!

  def update_song_count!(ctx, current_user:, **)
    binding.pry

    current_user = model
    current_user.increment_song_counter
  end

  private

  def increment_song_counter(ctx, current_user:, **)
    binding.pry
  end

end
