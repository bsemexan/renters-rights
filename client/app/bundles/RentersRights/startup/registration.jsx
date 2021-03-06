import ReactOnRails from 'react-on-rails';
import Home from '../components/Home';
import Renters from '../components/Renters';
import Eviction from '../components/Eviction';
import FAQ from '../components/FAQ';
import Resources from '../components/Resources';

// This is how react_on_rails can see the components in the browser.
ReactOnRails.register({
  Home,
  FAQ,
  Resources,
  Eviction,
  Renters,
});
